import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/presentation/navigation/pages.dart';
import 'package:crypto_app/core/presentation/constants/app_sizes.dart';
import 'package:crypto_app/core/presentation/constants/duration_constants.dart';
import 'package:crypto_app/features/tokens/presentation/notifiers/tokens_notifier.dart';
import 'package:crypto_app/core/presentation/widgets/custom_scaffold.dart';
import 'package:crypto_app/features/tokens/presentation/widgets/paginated_tokens_list_view.dart';
import 'package:crypto_app/features/tokens/presentation/widgets/token_tile.dart';
import 'package:crypto_app/features/tokens/presentation/widgets/tokens_search_bar.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class TokensPage extends HookWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchTokensTextEditingController = useTextEditingController();
    useListenable(searchTokensTextEditingController);
    final debouncedSearchTokensInput = useDebounced(
        searchTokensTextEditingController.text,
        DurationConstants.searchDebounceDuration);
    return CustomScaffold(
      appBar: AppBar(title: Text(S.current.coins_list)),
      body: Column(
        children: [
          TokensSearchBar(
              textEditingController: searchTokensTextEditingController),
          const Gap(AppSizes.spacingMedium),
          Expanded(
            child: PaginatedTokensListView(
              itemBuilder: (context, token) => TokenTile(
                token: token,
                onTap: () => Navigator.of(context).pushNamed(
                  Pages.tokenDetails,
                  arguments: token,
                ),
              ),
              tokensNotifierProvider:
                  tokensNotifierProvider(debouncedSearchTokensInput ?? ''),
              emptyListBuilder: (refresh) => Center(
                child: Text(S.current.token_list_empty),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
