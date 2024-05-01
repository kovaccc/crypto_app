import 'package:crypto_app/features/token_details/data/data_sources/token_details_remote_data_source.dart';
import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';
import 'package:crypto_app/features/tokens/data/data_sources/tokens_remote_data_source.dart';
import 'package:crypto_app/features/tokens/data/models/token_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient
    implements TokensRemoteDataSource, TokenDetailsRemoteDataSource {
  factory ApiClient(Dio dio) = _ApiClient;

  @override
  @GET('/api/v3/coins/markets')
  Future<List<TokenResponse>> getTokens(
      {@Query('vs_currency') required String targetCurrency,
      @Query('ids') required String tokenIds,
      @Query('page') int? page});

  @override
  @GET('/api/v3/coins/{id}')
  Future<TokenDetailsResponse> getTokenDetails(
      {@Path('id') required String tokenId,
      @Query('sparkline') required bool sparkline});
}
