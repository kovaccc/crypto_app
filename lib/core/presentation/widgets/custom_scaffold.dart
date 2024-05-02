import 'package:crypto_app/core/presentation/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final EdgeInsets padding;
  final Color? backgroundColor;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSizes.bodyHorizontalPadding,
      vertical: AppSizes.bodyVerticalPadding,
    ),
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: body,
        ),
      ),
    );
  }
}
