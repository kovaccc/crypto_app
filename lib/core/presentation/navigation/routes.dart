import 'package:crypto_app/core/presentation/navigation/pages.dart';
import 'package:crypto_app/features/token_details/presentation/pages/token_details_page.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:crypto_app/features/tokens/presentation/pages/tokens_page.dart';
import 'package:flutter/material.dart';

final routes = {
  Pages.tokens: (context) => const TokensPage(),
  Pages.tokenDetails: (context) {
    final token = ModalRoute.of(context)?.settings.arguments as Token;
    return TokenDetailsPage(
      token: token,
    );
  },
};
