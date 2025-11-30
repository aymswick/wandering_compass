import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show RepositoryProvider;
import 'package:schedule_repository/schedule_repository.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';
import 'package:wandering_compass_client/today/view/today_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: RepositoryProvider(
        create: (context) => const ScheduleRepository(),
        child: const TodayPage(),
      ),
    );
  }
}
