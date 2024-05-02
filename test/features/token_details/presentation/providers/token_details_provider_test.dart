import 'package:crypto_app/features/token_details/domain/use_cases/get_token_details_use_case.dart';
import 'package:crypto_app/features/token_details/presentation/providers/token_details_provider.dart';
import 'package:either_dart/either.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/token_details/di.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../test_variables.dart';

class MockGetTokenDetailsUseCase extends Mock
    implements GetTokenDetailsUseCase {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late MockGetTokenDetailsUseCase mockedUseCase;

  setUp(() {
    mockedUseCase = MockGetTokenDetailsUseCase();
    registerFallbackValue(const AsyncLoading<Token>());
  });

  ProviderContainer makeProviderContainer(MockGetTokenDetailsUseCase useCase) {
    final container = ProviderContainer(
      overrides: [
        getTokenDetailsUseCaseProvider.overrideWithValue(useCase),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  group('Token Details Provider', () {
    test(
        'should emit [AsyncLoading, AsyncValue.data(Token)] when getTokenDetailsUseCase returns token',
        () async {
      when(() => mockedUseCase(any()))
          .thenAnswer((_) async => const Right(testTokenWithDetails));

      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<Token>>();
      container.listen(
        getTokenDetailsProvider(tokenId: testTokenId),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();
      verifyInOrder([
        () => listener(null, const AsyncLoading<Token>()),
        () => listener(any(that: isA<AsyncLoading>()),
            const AsyncValue<Token>.data(testTokenWithDetails)),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase(testTokenId)).called(1);
    });

    test(
        'should emit [AsyncLoading, AsyncError] when getTokenDetailsUseCase returns failure',
        () async {
      when(() => mockedUseCase(any()))
          .thenAnswer((_) async => const Left(testGenericFailure));
      final container = makeProviderContainer(mockedUseCase);
      final listener = Listener<AsyncValue<Token>>();
      container.listen(
        getTokenDetailsProvider(tokenId: testTokenId),
        listener.call,
        fireImmediately: true,
      );

      await container.pump();

      verifyInOrder([
        () => listener(null, const AsyncLoading<Token>()),
        () => listener(any(that: isA<AsyncLoading<Token>>()),
            any(that: isA<AsyncError<Token>>())),
      ]);
      verifyNoMoreInteractions(listener);
      verify(() => mockedUseCase(testTokenId)).called(1);
    });
  });
}
