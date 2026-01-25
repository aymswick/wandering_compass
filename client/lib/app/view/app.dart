import 'package:authentication_repository/authentication_repository.dart';
import 'package:compass_api/compass_api.dart';
import 'package:compass_repository/compass_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wanderers_compass/app/bloc/app_bloc.dart';
import 'package:wanderers_compass/app/router.dart';
import 'package:wanderers_compass/app/theme.dart';
import 'package:wanderers_compass/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;
  @override
  Widget build(BuildContext context) {
    const terminalTheme = TerminalTheme(TextTheme());

    return MaterialApp.router(
      theme: terminalTheme.light(),
      darkTheme: terminalTheme.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter(_authenticationRepository).router,
      builder: (context, child) {
        return MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => CompassRepository(api: DartFrogCompassApi()),
            ),
            RepositoryProvider.value(
              value: _authenticationRepository,
            ),
          ],
          child: BlocProvider(
            create: (context) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),

            child: SafeArea(
              child: Scaffold(
                body: child ?? ErrorWidget.withDetails(),
              ),
            ),
          ),
        );
      },
    );
  }
}
