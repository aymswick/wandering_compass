import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandering_compass_client/onboarding/view/onboarding.dart';
import 'package:wandering_compass_client/today/view/today_pager.dart';

final appRouter = GoRouter(
  redirect: (context, state) async {
    final loggedIn =
        await SharedPreferencesAsync().getBool('has_completed_onboarding') ??
        false; // TODO(ant): replace with real auth
    final loggingIn = state.matchedLocation == '/onboarding';
    if (!loggedIn && !loggingIn) {
      return '/onboarding';
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
          path: 'onboarding',
          builder: (context, state) => const Onboarding(),
        ),
      ],
    ),
  ],
);
