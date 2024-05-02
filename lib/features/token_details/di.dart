import 'package:crypto_app/core/di.dart';
import 'package:crypto_app/features/token_details/data/mappers/token_details_response_mapper.dart';
import 'package:crypto_app/features/token_details/data/repositories/token_details_repository_impl.dart';
import 'package:crypto_app/features/token_details/domain/repositories/token_details_repository.dart';
import 'package:crypto_app/features/token_details/domain/use_cases/get_token_details_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// ******** DATA LAYER ********
final _tokenDetailsRepositoryProvider =
Provider<TokenDetailsRepository>((ref) => TokenDetailsRepositoryImpl(
  ref.watch(apiClientProvider),
  ref.watch(tokenDetailsResponseMapperProvider),
));

// ******** DOMAIN LAYER ********
final getTokenDetailsUseCaseProvider = Provider<GetTokenDetailsUseCase>(
  (ref) => GetTokenDetailsUseCase(
    ref.watch(_tokenDetailsRepositoryProvider),
  ),
);
