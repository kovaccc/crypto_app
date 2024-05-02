import 'package:crypto_app/core/domain/utils/logs/custom_provider_observer.dart';
import 'package:crypto_app/core/domain/utils/logs/disabled_printer.dart';
import 'package:crypto_app/core/presentation/navigation/routes.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: kDebugMode
        ? StreamPrinter(const PrettyDeveloperPrinter())
        : const DisabledPrinter(),
  );
  runApp(
    ProviderScope(
      observers: [CustomProviderObserver()],
      child: const CryptoApp(),
    ),
  );
}

class CryptoApp extends StatelessWidget {
  const CryptoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: const [
        Locale('en'),
      ],
      routes: routes,
      builder: (context, child) => Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}
