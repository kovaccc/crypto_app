import 'package:crypto_app/features/token_details/domain/repositories/token_details_repository.dart';
import 'package:crypto_app/features/token_details/domain/use_cases/get_token_details_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:either_dart/either.dart';

import '../../test_variables.dart';

class MockTokenDetailsRepository extends Mock
    implements TokenDetailsRepository {}

void main() {
  late MockTokenDetailsRepository mockTokensRepository;
  late GetTokenDetailsUseCase getTokenDetailsUseCase;

  setUp(() {
    mockTokensRepository = MockTokenDetailsRepository();
    getTokenDetailsUseCase = GetTokenDetailsUseCase(mockTokensRepository);
  });

  test(
    'should return Right(Token) when repository returns a success result',
    () async {
      // Setup the mock call
      when(() => mockTokensRepository.getTokenDetails(
              sparkline: true, tokenId: testTokenId))
          .thenAnswer((_) async => const Right(testTokenWithDetails));

      // Perform the action
      final result = await getTokenDetailsUseCase(testTokenId);

      // Verify the result
      expect(result.isRight, isTrue);
      expect(result.right, testTokenWithDetails);
      verify(() => mockTokensRepository.getTokenDetails(
          sparkline: true, tokenId: testTokenId)).called(1);
    },
  );

  test(
    'should return Left(Failure) when repository encounters an error',
    () async {
      // Setup the mock call
      when(() => mockTokensRepository.getTokenDetails(
              sparkline: true, tokenId: testTokenId))
          .thenAnswer((_) async => const Left(testGenericFailure));

      // Perform the action
      final result = await getTokenDetailsUseCase(testTokenId);

      // Verify the result
      expect(result.isLeft, isTrue);
      expect(result.left, testGenericFailure);
      verify(() => mockTokensRepository.getTokenDetails(
          sparkline: true, tokenId: testTokenId)).called(1);
    },
  );
}
