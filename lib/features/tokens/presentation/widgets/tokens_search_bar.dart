import 'package:crypto_app/core/presentation/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class TokensSearchBar extends StatelessWidget {
  final TextEditingController textEditingController;

  const TokensSearchBar({super.key, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: textEditingController,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: AppSizes.spacingLarge)),
      leading: const Icon(Icons.search),
      trailing: const [Icon(Icons.currency_bitcoin)],
    );
  }
}
