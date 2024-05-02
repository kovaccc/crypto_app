import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/features/token_details/data/data_sources/token_details_remote_data_source.dart';
import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';
import 'package:crypto_app/features/token_details/data/repositories/token_details_repository_impl.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/core/domain/failures/failure.dart';

import '../../../token_details/test_variables.dart';

class MockTokenDetailsRemoteDataSource extends Mock
    implements TokenDetailsRemoteDataSource {}

ResponseMapper<Token, TokenDetailsResponse> _mockedTokenDetailsResponseMapper =
    (_) => testTokenWithDetails;

void main() {
  late MockTokenDetailsRemoteDataSource mockTokenDetailsRemoteDataSource;
  late TokenDetailsRepositoryImpl tokenDetailsRepository;

  setUp(() async {
    await S.load(const Locale('en'));
    mockTokenDetailsRemoteDataSource = MockTokenDetailsRemoteDataSource();
    tokenDetailsRepository = TokenDetailsRepositoryImpl(
      mockTokenDetailsRemoteDataSource,
      _mockedTokenDetailsResponseMapper,
    );
  });

  test(
      'getTokenDetails should return Right(Token) when TokenDetailsRemoteDataSource returns success result',
      () async {
    when(() => mockTokenDetailsRemoteDataSource.getTokenDetails(
            sparkline: true, tokenId: testTokenId))
        .thenAnswer((_) async => testTokenDetailsResponse);

    final result = await tokenDetailsRepository.getTokenDetails(
        sparkline: true, tokenId: testTokenId);

    expect(result.isRight, isTrue);
    expect(result.right, testTokenWithDetails);
    verify(() => mockTokenDetailsRemoteDataSource.getTokenDetails(
        sparkline: true, tokenId: testTokenId)).called(1);
  });

  test(
      'getTokenDetails should return Left(Failure) when TokenDetailsRemoteDataSource throws exception',
      () async {
    when(() => mockTokenDetailsRemoteDataSource.getTokenDetails(
        sparkline: true, tokenId: testTokenId)).thenThrow(Exception());

    final result = await tokenDetailsRepository.getTokenDetails(
        sparkline: true, tokenId: testTokenId);

    expect(result.isLeft, isTrue);
    expect(result.left, isA<Failure>());
    verify(() => mockTokenDetailsRemoteDataSource.getTokenDetails(
        sparkline: true, tokenId: testTokenId)).called(1);
  });
}
