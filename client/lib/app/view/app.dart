import 'package:compass_api/compass_api.dart';
import 'package:compass_repository/compass_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanderers_compass/app/router.dart';
import 'package:wanderers_compass/app/theme.dart';
import 'package:wanderers_compass/l10n/l10n.dart';

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
        return RepositoryProvider(
          create: (context) => CompassRepository(api: DartFrogCompassApi()),
          child: Scaffold(
            body: child ?? ErrorWidget.withDetails(),
          ),
        );
      },
    );
  }
}
