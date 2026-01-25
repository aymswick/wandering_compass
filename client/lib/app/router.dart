import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderers_compass/app/bloc/app_bloc.dart';
import 'package:wanderers_compass/login/view/login_page.dart';
import 'package:wanderers_compass/onboarding/view/onboarding.dart';
import 'package:wanderers_compass/today/view/today_pager.dart';

class AppRouter {
  AppRouter(this.authenticationRepository);
  final AuthenticationRepository authenticationRepository;

  late final router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authenticationRepository.status),
    redirect: (context, state) async {
      // throw UnimplementedError();
      final loggedIn =
          context.read<AppBloc>().state.authenticationStatus ==
          AuthenticationStatus.authenticated;

      final loggingIn = state.matchedLocation == '/login';
      if (!loggedIn && !loggingIn) {
        return '/login';
      }
      if (loggedIn && loggingIn) {
        return '/';
      }
      return null; // no redirect
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TodayPage(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: 'onboarding',
            builder: (context, state) => const OnboardingPage(),
          ),
        ],
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
