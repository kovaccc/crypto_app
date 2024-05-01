import 'package:crypto_app/core/domain/typedefs/paginated_either_failure_or.dart';
import 'package:crypto_app/core/domain/constants/currency_constants.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/tokens/domain/repositories/tokens_repository.dart';

class GetTokensUseCase {
  final TokensRepository _tokensRepository;

  GetTokensUseCase(this._tokensRepository);

  PaginatedEitherFailureOr<Token> call(String tokenIds, int page) =>
      _tokensRepository.getTokens(
          targetCurrency: CurrencyConstants.usdCurrencyAbbreviation,
          tokenIds: tokenIds,
          page: page);
}
