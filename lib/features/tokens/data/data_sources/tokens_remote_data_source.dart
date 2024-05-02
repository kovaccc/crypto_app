import 'package:crypto_app/features/tokens/data/models/token_response.dart';

abstract interface class TokensRemoteDataSource {
  Future<List<TokenResponse>> getTokens(
      {required String targetCurrency, required String tokenIds, int? page});
}
