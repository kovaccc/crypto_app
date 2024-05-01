import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/features/tokens/di.dart';
import 'package:crypto_app/features/tokens/domain/use_cases/get_tokens_use_case.dart';
import 'package:crypto_app/features/tokens/presentation/notifiers/tokens_notifier.dart';
import 'package:either_dart/either.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../test_variables.dart';

class MockGetTokensUseCase extends Mock implements GetTokensUseCase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetTokensUseCase mockedUseCase;
  setUpAll(() {
    mockedUseCase = MockGetTokensUseCase();
    registerFallbackValue(const AsyncLoading<PaginatedList<Token>>());
    registerFallbackValue(List<Token>);
    registerFallbackValue(AsyncError<PaginatedList<Token>>(
        testGenericFailure, testGenericFailure.stackTrace ?? StackTrace.empty));
  });

  ProviderContainer makeProviderContainer(MockGetTokensUseCase useCase) {
    final container = ProviderContainer(
      overrides: [
        getTokensUseCaseProvider.overrideWithValue(useCase),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('Tokens provider', () {
    test(
        'get initial token page in build method success, should emit [AsyncLoading, AsyncData(PaginatedList<Token>)] when use case returns paginated tokens',
        () async {
      when(() => mockedUseCase('', testPageNumber))
          .thenAnswer((_) async => const Right(testPaginatedTokens));

      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<PaginatedList<Token>>>();
      container.listen(
        tokensNotifierProvider(''),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();
      verifyInOrder([
        () => listener(null, const AsyncLoading<PaginatedList<Token>>()),
        () => listener(any(that: isA<AsyncLoading>()),
            const AsyncValue<PaginatedList<Token>>.data(testPaginatedTokens)),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase('', testPageNumber)).called(1);
    });

    test(
        'get initial token page in build method failure, should emit [AsyncLoading, AsyncError] when use case returns failure',
        () async {
      when(() => mockedUseCase('', testPageNumber))
          .thenAnswer((_) async => const Left(testGenericFailure));
      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<PaginatedList<Token>>>();
      container.listen(
        tokensNotifierProvider(''),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();

      verifyInOrder([
        () => listener(null, const AsyncLoading<PaginatedList<Token>>()),
        () => listener(any(that: isA<AsyncLoading<PaginatedList<Token>>>()),
            any(that: isA<AsyncError<PaginatedList<Token>>>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase('', testPageNumber)).called(1);
    });

    test('getNextPage success with next page of tokens', () async {
      const initialPaginatedTokens = testPaginatedTokens;
      final nextPageTokens = testPaginatedTokens.copyWith(
        data: const [testToken, testToken],
        page: initialPaginatedTokens.page + 1,
      );

      when(() => mockedUseCase('', initialPaginatedTokens.page))
          .thenAnswer((_) async => const Right(initialPaginatedTokens));
      when(() => mockedUseCase('', nextPageTokens.page))
          .thenAnswer((_) async => Right(nextPageTokens));

      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<PaginatedList<Token>>>();
      container.listen(
        tokensNotifierProvider(''),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();

      final notifier = container.read(tokensNotifierProvider('').notifier);

      await notifier.getNextPage();

      const initialData =
          AsyncValue<PaginatedList<Token>>.data(initialPaginatedTokens);

      verifyInOrder([
        () => listener(null, const AsyncLoading<PaginatedList<Token>>()),
        () => listener(
              const AsyncLoading<PaginatedList<Token>>(),
              initialData,
            ),
        () => listener(
              initialData,
              any(that: isA<AsyncLoading>()),
            ),
        () => listener(
            any(that: isA<AsyncLoading>()),
            any(
                that: isA<AsyncValue<PaginatedList<Token>>>().having(
                    (p) => p.valueOrNull?.page, 'page', nextPageTokens.page))),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase('', initialPaginatedTokens.page)).called(1);
      verify(() => mockedUseCase('', nextPageTokens.page)).called(1);
    });

    test('getNextPage is not proceed when current page is last', () async {
      final initialPaginatedTokens = testPaginatedTokens.copyWith(isLast: true);

      when(() => mockedUseCase('', initialPaginatedTokens.page))
          .thenAnswer((_) async => Right(initialPaginatedTokens));

      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<PaginatedList<Token>>>();
      container.listen(
        tokensNotifierProvider(''),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();

      final notifier = container.read(tokensNotifierProvider('').notifier);

      await notifier.getNextPage();

      final initialData =
          AsyncValue<PaginatedList<Token>>.data(initialPaginatedTokens);

      verifyInOrder([
        () => listener(null, const AsyncLoading<PaginatedList<Token>>()),
        () => listener(
              const AsyncLoading<PaginatedList<Token>>(),
              initialData,
            ),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase('', initialPaginatedTokens.page)).called(1);
    });

    test('getNextPage is not proceed next page is already loading', () async {
      const initialPaginatedTokens = testPaginatedTokens;

      final nextPageTokens = testPaginatedTokens.copyWith(
        data: const [testToken, testToken],
        page: initialPaginatedTokens.page + 1,
      );

      when(() => mockedUseCase('', initialPaginatedTokens.page))
          .thenAnswer((_) async => const Right(initialPaginatedTokens));
      when(() => mockedUseCase('', nextPageTokens.page))
          .thenAnswer((_) async => Right(nextPageTokens));

      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<PaginatedList<Token>>>();
      container.listen(
        tokensNotifierProvider(''),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();

      final notifier = container.read(tokensNotifierProvider('').notifier);

      notifier.getNextPage();
      await notifier.getNextPage();

      const initialData =
          AsyncValue<PaginatedList<Token>>.data(initialPaginatedTokens);

      verifyInOrder([
        () => listener(null, const AsyncLoading<PaginatedList<Token>>()),
        () => listener(
              const AsyncLoading<PaginatedList<Token>>(),
              initialData,
            ),
        () => listener(
              initialData,
              any(that: isA<AsyncLoading>()),
            ),
        () => listener(
            any(that: isA<AsyncLoading>()),
            any(
                that: isA<AsyncValue<PaginatedList<Token>>>().having(
                    (p) => p.valueOrNull?.page, 'page', nextPageTokens.page))),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase('', initialPaginatedTokens.page)).called(1);
      verify(() => mockedUseCase('', nextPageTokens.page)).called(1);
    });

    test('getNextPage failure when trying to load next page', () async {
      const initialPaginatedTokens = testPaginatedTokens;

      when(() => mockedUseCase(any(), 1))
          .thenAnswer((_) async => const Right(initialPaginatedTokens));
      when(() => mockedUseCase(any(), 2))
          .thenAnswer((_) async => const Left(testGenericFailure));

      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<PaginatedList<Token>>>();
      container.listen(
        tokensNotifierProvider(''),
        listener.call,
        fireImmediately: true,
      );

      final notifier = container.read(tokensNotifierProvider('').notifier);

      // Trigger to get next page
      await container.pump();

      await notifier.getNextPage();

      verifyInOrder([
        () => listener(null, const AsyncLoading<PaginatedList<Token>>()),
        () => listener(
            const AsyncLoading<PaginatedList<Token>>(),
            const AsyncValue<PaginatedList<Token>>.data(
                initialPaginatedTokens)),
        () => listener(
            const AsyncValue<PaginatedList<Token>>.data(initialPaginatedTokens),
            any(that: isA<AsyncLoading>())),
        () => listener(
            any(that: isA<AsyncLoading>()), any(that: isA<AsyncError>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase('', 1)).called(1);
      verify(() => mockedUseCase('', 2)).called(1);
    });
  });
}
