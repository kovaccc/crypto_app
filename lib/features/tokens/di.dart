import 'package:crypto_app/core/di.dart';
import 'package:crypto_app/features/tokens/data/mappers/paginated_tokens_response_mapper.dart';
import 'package:crypto_app/features/tokens/domain/use_cases/get_tokens_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto_app/features/tokens/data/repositories/tokens_repository_impl.dart';

import 'package:crypto_app/features/tokens/domain/repositories/tokens_repository.dart';

// ********* DATA LAYER *********
final _tokensRepositoryProvider =
    Provider<TokensRepository>((ref) => TokensRepositoryImpl(
          ref.watch(apiClientProvider),
          ref.watch(paginatedTokensResponseMapperProvider),
        ));

// ******** DOMAIN LAYER ********
final getTokensUseCaseProvider = Provider<GetTokensUseCase>(
  (ref) => GetTokensUseCase(
    ref.watch(_tokensRepositoryProvider),
  ),
);
