import 'package:crypto_app/core/data/error_resolvers/base_api_error_resolver.dart';
import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/core/data/mixins/error_to_failure_mixin.dart';
import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/core/domain/typedefs/paginated_either_failure_or.dart';
import 'package:crypto_app/features/tokens/data/data_sources/tokens_remote_data_source.dart';
import 'package:crypto_app/features/tokens/data/typedefs/token_responses_with_page.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:either_dart/either.dart';
import 'package:crypto_app/features/tokens/domain/repositories/tokens_repository.dart';

class TokensRepositoryImpl
    with ErrorToFailureMixin
    implements TokensRepository {
  final TokensRemoteDataSource _tokensRemoteDataSource;
  final ResponseMapper<PaginatedList<Token>, TokenResponsesWithPage>
      _paginatedTokensResponseMapper;

  TokensRepositoryImpl(
    this._tokensRemoteDataSource,
    this._paginatedTokensResponseMapper,
  );

  @override
  PaginatedEitherFailureOr<Token> getTokens(
          {required String targetCurrency,
          required String tokenIds,
          required int page}) =>
      execute(() async {
        final tokensResponse = await _tokensRemoteDataSource.getTokens(
            targetCurrency: targetCurrency, tokenIds: tokenIds, page: page);
        final paginatedTokens =
            _paginatedTokensResponseMapper((tokensResponse, page));
        return Right(paginatedTokens);
      }, errorResolver: BaseApiErrorResolver());
}
