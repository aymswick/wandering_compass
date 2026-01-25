import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(const AppState()) {
    on<AuthenticationStatusChanged>(
      (event, emit) {
        return emit.onEach(
          _authenticationRepository.status,
          onData: (status) => emit(AppState(authenticationStatus: status)),
          onError: addError,
        );
      },
    );

    _authStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus> _authStatusSubscription;

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }
}
