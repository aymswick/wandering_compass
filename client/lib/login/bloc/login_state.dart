part of 'login_bloc.dart';

@MappableClass()
class LoginState with LoginStateMappable {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.isSignup = false,
    this.message,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? message;
  final bool isSignup;
}
