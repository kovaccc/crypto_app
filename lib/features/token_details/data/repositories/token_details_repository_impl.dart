import 'package:crypto_app/core/data/error_resolvers/base_api_error_resolver.dart';
import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/core/data/mixins/error_to_failure_mixin.dart';
import 'package:crypto_app/core/domain/typedefs/either_failure_or.dart';
import 'package:crypto_app/features/token_details/data/data_sources/token_details_remote_data_source.dart';
import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';
import 'package:crypto_app/features/token_details/domain/repositories/token_details_repository.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:either_dart/either.dart';

class TokenDetailsRepositoryImpl
    with ErrorToFailureMixin
    implements TokenDetailsRepository {
  final TokenDetailsRemoteDataSource _tokenDetailsRemoteDataSource;
  final ResponseMapper<Token, TokenDetailsResponse> _tokenDetailsResponseMapper;

  TokenDetailsRepositoryImpl(
    this._tokenDetailsRemoteDataSource,
    this._tokenDetailsResponseMapper,
  );

  @override
  EitherFailureOr<Token> getTokenDetails(
          {required bool sparkline, required String tokenId}) =>
      execute(() async {
        final tokenResponse = await _tokenDetailsRemoteDataSource
            .getTokenDetails(sparkline: sparkline, tokenId: tokenId);
        final token = _tokenDetailsResponseMapper(tokenResponse);
        return Right(token);
      }, errorResolver: BaseApiErrorResolver());
}
