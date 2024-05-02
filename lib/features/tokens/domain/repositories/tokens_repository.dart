import 'package:crypto_app/core/domain/typedefs/paginated_either_failure_or.dart';
import 'package:crypto_app/core/domain/entities/token.dart';

abstract interface class TokensRepository {
  PaginatedEitherFailureOr<Token> getTokens(
      {required String targetCurrency,
      required String tokenIds,
      required int page});
}
