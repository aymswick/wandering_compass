import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:wanderers_compass/login/bloc/login_bloc.dart';
import 'package:wanderers_compass/shared/input_types.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    final theme = Theme.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Generic failure'),
              backgroundColor: theme.colorScheme.error,
            ),
          );
        } else if (state.status == FormzSubmissionStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Success!'),
              backgroundColor: Colors.lightGreen,
            ),
          );
          if (!state.isSignup) {
            context.go('/onboarding');
          }
        }
      },
      builder: (context, state) => Column(
        spacing: 16,
        children: [
          _EmailInput(),
          _PasswordInput(),
          Row(
            children: [
              FilledButton.tonal(
                onPressed: () => bloc.add(const LoginSubmitted()),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => bloc.add(const RegistrationSubmitted()),
                child: const Text('or sign up'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>(),
          ),
          child: const LoginForm(),
        ),
      ),
    );
  }

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (email) =>
          context.read<LoginBloc>().add(LoginEmailChanged(email)),
      decoration: const InputDecoration(labelText: 'email'),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Select only the password part of the state to optimize rebuilds
    final password = context.select((LoginBloc bloc) => bloc.state.password);

    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        helperText: '',
        errorText: password.displayError != null
            ? _getErrorMessage(password.error)
            : null,
      ),
    );
  }

  String? _getErrorMessage(PasswordValidationError? error) {
    if (error == PasswordValidationError.empty)
      return 'Password cannot be empty';
    if (error == PasswordValidationError.invalid)
      return 'Password too short (min 8 chars)';
    return null;
  }
}
