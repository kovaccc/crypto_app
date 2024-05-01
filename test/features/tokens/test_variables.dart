import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/features/tokens/data/models/token_response.dart';
import 'package:crypto_app/core/domain/entities/token.dart';

const testGenericFailure = Failure(title: "Error occurred");

const testToken = Token(
  id: 'tether',
  symbol: 'usdt',
  name: 'Tether',
  image:
      'https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661',
  currentPrice: 0.999404,
  priceChangePercentage24h: -0.05238,
  marketCapRank: 3,
);

const testTokenResponse = TokenResponse(
  id: 'tether',
  symbol: 'usdt',
  name: 'Tether',
  image:
      'https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661',
  currentPrice: 0.999404,
  priceChangePercentage24h: -0.05238,
  marketCapRank: 3,
);

const testPageNumber = 1;

const testPaginatedTokens =
    PaginatedList(data: [testToken], page: testPageNumber, isLast: false);
