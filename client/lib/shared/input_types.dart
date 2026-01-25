import 'package:formz/formz.dart';

/// Formz input type used in Login for now
class Email extends FormzInput<String, EmailValidationError> {
  const Email.dirty([super.value = '']) : super.dirty();

  const Email.pure() : super.pure('');

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    return _emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

enum EmailValidationError { invalid, empty }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.dirty([super.value = '']) : super.dirty();
  const Password.pure() : super.pure('');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    }

    return value.length >= 8 ? null : PasswordValidationError.invalid;
  }
}

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  invalid,

  empty,
}
