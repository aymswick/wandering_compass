import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:formz/formz.dart';
import 'package:shared/shared.dart' show logger;
import 'package:wanderers_compass/shared/input_types.dart';

part 'login_bloc.mapper.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<RegistrationSubmitted>(_onRegistrationSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.inProgress,
      ),
    );
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logIn(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.success,
          isSignup: false,
        ),
      );
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
        status: FormzSubmissionStatus.inProgress,
      ),
    );
  }

  Future<void> _onRegistrationSubmitted(
    RegistrationSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(
        state.copyWith(status: FormzSubmissionStatus.success, isSignup: true),
      );
    } catch (e) {
      logger.e(e);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          message: e.toString(),
        ),
      );
    }
  }
}
