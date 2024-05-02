import 'package:crypto_app/features/token_details/di.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_details_provider.g.dart';

@riverpod
Future<Token> getTokenDetails(
  GetTokenDetailsRef ref, {
  required String tokenId,
}) async {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final getTokenDetailsUseCase = ref.watch(getTokenDetailsUseCaseProvider);
  return getTokenDetailsUseCase(tokenId)
      .fold((failure) => throw failure, (token) => token);
}
