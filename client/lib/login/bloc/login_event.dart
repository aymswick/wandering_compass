part of 'login_bloc.dart';

/// Fired when the user types in the email field.
final class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);

  final String email;
}

sealed class LoginEvent {
  const LoginEvent();
}

/// Fired when the user types in the password field.
final class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;
}

/// Fired when the user taps the login button.
final class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

/// Fired when user taps signup button
final class RegistrationSubmitted extends LoginEvent {
  const RegistrationSubmitted();
}
