part of 'app_bloc.dart';

@immutable
class AppState {
  const AppState({this.authenticationStatus = AuthenticationStatus.unknown});

  final AuthenticationStatus authenticationStatus;
}
