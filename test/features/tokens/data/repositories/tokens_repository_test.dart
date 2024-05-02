import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/core/domain/constants/currency_constants.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:crypto_app/features/tokens/data/data_sources/tokens_remote_data_source.dart';
import 'package:crypto_app/features/tokens/data/repositories/tokens_repository_impl.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/tokens/data/typedefs/token_responses_with_page.dart';
import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/core/domain/failures/failure.dart';

import '../../test_variables.dart';

class MockTokensRemoteDataSource extends Mock
    implements TokensRemoteDataSource {}

ResponseMapper<PaginatedList<Token>, TokenResponsesWithPage>
    _mockedPaginatedTokensResponse = (_) => testPaginatedTokens;

void main() {
  late MockTokensRemoteDataSource mockTokensRemoteDataSource;
  late TokensRepositoryImpl tokensRepository;

  setUp(() async {
    await S.load(const Locale('en'));
    mockTokensRemoteDataSource = MockTokensRemoteDataSource();
    tokensRepository = TokensRepositoryImpl(
      mockTokensRemoteDataSource,
      _mockedPaginatedTokensResponse,
    );
  });

  group('Tokens Repository', () {
    test(
        'getTokens should return Right(PaginatedList<Token>) when TokenRemoteDataSource returns success result',
        () async {
      when(() => mockTokensRemoteDataSource.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber)).thenAnswer((_) async => [testTokenResponse]);

      final result = await tokensRepository.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber);

      expect(result.isRight, isTrue);
      expect(result.right, testPaginatedTokens);
      verify(() => mockTokensRemoteDataSource.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber)).called(1);
    });

    test(
        'getTokens should return Left(Failure) when TokenRemoteDataSource throws exception',
        () async {
      when(() => mockTokensRemoteDataSource.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber)).thenThrow(Exception());

      final result = await tokensRepository.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber);

      expect(result.isLeft, isTrue);
      expect(result.left, isA<Failure>());
      verify(() => mockTokensRemoteDataSource.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: '',
          page: testPageNumber)).called(1);
    });
  });
}
