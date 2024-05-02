import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/features/token_details/presentation/providers/token_details_provider.dart';
import 'package:crypto_app/features/token_details/presentation/widgets/calculator_form.dart';
import 'package:crypto_app/features/token_details/presentation/widgets/token_price_graph.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/core/presentation/constants/app_sizes.dart';
import 'package:crypto_app/core/presentation/widgets/custom_scaffold.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TokenDetailsPage extends HookConsumerWidget {
  final Token token;

  const TokenDetailsPage({super.key, required this.token});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenDetailsState =
        ref.watch(getTokenDetailsProvider(tokenId: token.id));

    return CustomScaffold(
      appBar: AppBar(title: Text(token.name)),
      body: tokenDetailsState.when(
        data: (token) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HtmlWidget(token.description ?? ''),
              const Gap(AppSizes.spacingLarge),
              if (token.prices?.isNotEmpty == true) ...[
                const Gap(AppSizes.spacingLarge),
                TokenPriceGraph(prices: token.prices!),
                const Gap(AppSizes.spacingMedium),
                Center(
                  child: Text(S.current.token_price_graph_description),
                ),
                const Gap(AppSizes.spacingLarge),
              ],
              CalculatorForm(price: token.currentPrice),
              const Gap(AppSizes.spacingLarge),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (failure, _) => Center(
            child:
                Text(failure is Failure ? failure.title : failure.toString())),
      ),
    );
  }
}
