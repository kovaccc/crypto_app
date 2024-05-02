import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/features/tokens/di.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/tokens/domain/use_cases/get_tokens_use_case.dart';
import 'package:either_dart/either.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tokens_notifier.g.dart';

@riverpod
class TokensNotifier extends _$TokensNotifier {
  late GetTokensUseCase _getTokensUseCase;

  @override
  Future<PaginatedList<Token>> build(String query) async {
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    _getTokensUseCase = ref.read(getTokensUseCaseProvider);
    return _getTokensUseCase(query, 1)
        .fold((failure) => throw failure, (paginatedTokens) => paginatedTokens);
  }

  Future<void> getNextPage() async {
    final currentPaginatedState = state.valueOrNull;
    if (currentPaginatedState?.isLast ?? false) return;
    if (state is AsyncLoading) return;
    state = const AsyncLoading();
    final nextPage = (currentPaginatedState?.page ?? 0) + 1;
    await (_getTokensUseCase(query, nextPage)).fold(
      (failure) {
        state =
            AsyncValue.error(failure, failure.stackTrace ?? StackTrace.empty);
      },
      (newPaginatedListForPage) {
        final currentList = currentPaginatedState?.data ?? [];
        final updatedList = currentList + newPaginatedListForPage.data;
        state = AsyncValue.data(
            newPaginatedListForPage.copyWith(data: updatedList));
      },
    );
  }

  void refresh() => ref.invalidateSelf();
}
