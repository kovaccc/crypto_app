import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';

abstract interface class TokenDetailsRemoteDataSource {
  Future<TokenDetailsResponse> getTokenDetails(
      {required String tokenId, required bool sparkline});
}
