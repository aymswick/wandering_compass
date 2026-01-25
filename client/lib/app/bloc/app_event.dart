part of 'app_bloc.dart';

@immutable
sealed class AppEvent {
  const AppEvent();
}

final class AppLogoutRequested extends AppEvent {
  const AppLogoutRequested();
}

final class AuthenticationStatusChanged extends AppEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}
