import 'package:crypto_app/features/tokens/domain/use_cases/get_tokens_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:either_dart/either.dart';
import 'package:crypto_app/core/domain/constants/currency_constants.dart';
import 'package:crypto_app/features/tokens/domain/repositories/tokens_repository.dart';

import '../../test_variables.dart';

class MockTokensRepository extends Mock implements TokensRepository {}

void main() {
  late MockTokensRepository mockTokensRepository;
  late GetTokensUseCase getTokensUseCase;

  setUp(() {
    mockTokensRepository = MockTokensRepository();
    getTokensUseCase = GetTokensUseCase(mockTokensRepository);
  });

  test(
    'should return a Right(PaginatedList<Token>) when repository returns a success result',
    () async {
      // Setup the mock call
      when(() => mockTokensRepository.getTokens(
              targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
              page: testPageNumber,
              tokenIds: ''))
          .thenAnswer((_) async => const Right(testPaginatedTokens));

      // Perform the action
      final result = await getTokensUseCase('', testPageNumber);

      // Verify the result
      expect(result.isRight, isTrue);
      expect(result.right, testPaginatedTokens);
      verify(() => mockTokensRepository.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber)).called(1);
    },
  );

  test(
    'should return a Left(Failure) when repository encounters an error',
    () async {
      // Setup the mock call
      when(() => mockTokensRepository.getTokens(
              targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
              tokenIds: '',
              page: testPageNumber))
          .thenAnswer((_) async => const Left(testGenericFailure));

      // Perform the action
      final result = await getTokensUseCase('', testPageNumber);

      // Verify the result
      expect(result.isLeft, isTrue);
      expect(result.left, testGenericFailure);
      verify(() => mockTokensRepository.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber)).called(1);
    },
  );
}
