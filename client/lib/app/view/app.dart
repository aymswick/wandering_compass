import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_api/schedule_api.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:wandering_compass_client/app/router.dart';
import 'package:wandering_compass_client/app/theme.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({required this.scheduleApiClient, super.key});

  final ScheduleApi scheduleApiClient;

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
          create: (context) => ScheduleRepository(api: LocalFileScheduleApi()),
          child: Scaffold(
            body: child ?? ErrorWidget.withDetails(),
          ),
        );
      },
    );
  }
}
