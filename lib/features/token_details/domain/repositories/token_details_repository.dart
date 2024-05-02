import 'package:crypto_app/core/domain/typedefs/either_failure_or.dart';
import 'package:crypto_app/core/domain/entities/token.dart';

abstract interface class TokenDetailsRepository {
  EitherFailureOr<Token> getTokenDetails(
      {required bool sparkline, required String tokenId});
}
