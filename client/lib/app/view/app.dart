import 'package:flutter/material.dart';
import 'package:wandering_compass_client/app/router.dart';
import 'package:wandering_compass_client/app/theme.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter,
      builder: (context, child) {
        return Scaffold(
          body: child ?? ErrorWidget.withDetails(),
        );
      },
    );
  }
}
