import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/features/tokens/data/models/token_response.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tokenResponseMapperProvider =
    Provider<ResponseMapper<Token, TokenResponse>>(
  (ref) => (response) => Token(
        id: response.id,
        image: response.image,
        name: response.name,
        symbol: response.symbol,
        currentPrice: response.currentPrice,
        priceChangePercentage24h: response.priceChangePercentage24h,
        marketCapRank: response.marketCapRank,
      ),
);
