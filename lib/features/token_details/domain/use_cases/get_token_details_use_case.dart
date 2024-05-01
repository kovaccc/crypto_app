import 'package:crypto_app/core/domain/typedefs/either_failure_or.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/token_details/domain/repositories/token_details_repository.dart';

class GetTokenDetailsUseCase {
  final TokenDetailsRepository _tokenDetailsRepository;

  GetTokenDetailsUseCase(
    this._tokenDetailsRepository,
  );

  EitherFailureOr<Token> call(String tokenId) =>
      _tokenDetailsRepository.getTokenDetails(sparkline: true, tokenId: tokenId);
}
