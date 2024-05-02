import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tokenDetailsResponseMapperProvider =
    Provider<ResponseMapper<Token, TokenDetailsResponse>>(
  (ref) => (response) => Token(
        id: response.id,
        image: response.image.small,
        name: response.name,
        symbol: response.symbol,
        currentPrice: response.marketData.currentPrice.usd,
        priceChangePercentage24h: response.marketData.priceChangePercentage24h,
        marketCapRank: response.marketCapRank,
        prices: response.marketData.sparkline7d.prices,
        description: response.description.enText,
      ),
);
