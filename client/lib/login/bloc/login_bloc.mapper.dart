// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_bloc.dart';

class LoginStateMapper extends ClassMapperBase<LoginState> {
  LoginStateMapper._();

  static LoginStateMapper? _instance;
  static LoginStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginState';

  static Email _$email(LoginState v) => v.email;
  static const Field<LoginState, Email> _f$email = Field(
    'email',
    _$email,
    opt: true,
    def: const Email.pure(),
  );
  static Password _$password(LoginState v) => v.password;
  static const Field<LoginState, Password> _f$password = Field(
    'password',
    _$password,
    opt: true,
    def: const Password.pure(),
  );
  static FormzSubmissionStatus _$status(LoginState v) => v.status;
  static const Field<LoginState, FormzSubmissionStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: FormzSubmissionStatus.initial,
  );
  static bool _$isValid(LoginState v) => v.isValid;
  static const Field<LoginState, bool> _f$isValid = Field(
    'isValid',
    _$isValid,
    opt: true,
    def: false,
  );
  static bool _$isSignup(LoginState v) => v.isSignup;
  static const Field<LoginState, bool> _f$isSignup = Field(
    'isSignup',
    _$isSignup,
    opt: true,
    def: false,
  );
  static String? _$message(LoginState v) => v.message;
  static const Field<LoginState, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<LoginState> fields = const {
    #email: _f$email,
    #password: _f$password,
    #status: _f$status,
    #isValid: _f$isValid,
    #isSignup: _f$isSignup,
    #message: _f$message,
  };

  static LoginState _instantiate(DecodingData data) {
    return LoginState(
      email: data.dec(_f$email),
      password: data.dec(_f$password),
      status: data.dec(_f$status),
      isValid: data.dec(_f$isValid),
      isSignup: data.dec(_f$isSignup),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static LoginState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LoginState>(map);
  }

  static LoginState fromJson(String json) {
    return ensureInitialized().decodeJson<LoginState>(json);
  }
}

mixin LoginStateMappable {
  String toJson() {
    return LoginStateMapper.ensureInitialized().encodeJson<LoginState>(
      this as LoginState,
    );
  }

  Map<String, dynamic> toMap() {
    return LoginStateMapper.ensureInitialized().encodeMap<LoginState>(
      this as LoginState,
    );
  }

  LoginStateCopyWith<LoginState, LoginState, LoginState> get copyWith =>
      _LoginStateCopyWithImpl<LoginState, LoginState>(
        this as LoginState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return LoginStateMapper.ensureInitialized().stringifyValue(
      this as LoginState,
    );
  }

  @override
  bool operator ==(Object other) {
    return LoginStateMapper.ensureInitialized().equalsValue(
      this as LoginState,
      other,
    );
  }

  @override
  int get hashCode {
    return LoginStateMapper.ensureInitialized().hashValue(this as LoginState);
  }
}

extension LoginStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginState, $Out> {
  LoginStateCopyWith<$R, LoginState, $Out> get $asLoginState =>
      $base.as((v, t, t2) => _LoginStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LoginStateCopyWith<$R, $In extends LoginState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    bool? isSignup,
    String? message,
  });
  LoginStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LoginStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginState, $Out>
    implements LoginStateCopyWith<$R, LoginState, $Out> {
  _LoginStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginState> $mapper =
      LoginStateMapper.ensureInitialized();
  @override
  $R call({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    bool? isSignup,
    Object? message = $none,
  }) => $apply(
    FieldCopyWithData({
      if (email != null) #email: email,
      if (password != null) #password: password,
      if (status != null) #status: status,
      if (isValid != null) #isValid: isValid,
      if (isSignup != null) #isSignup: isSignup,
      if (message != $none) #message: message,
    }),
  );
  @override
  LoginState $make(CopyWithData data) => LoginState(
    email: data.get(#email, or: $value.email),
    password: data.get(#password, or: $value.password),
    status: data.get(#status, or: $value.status),
    isValid: data.get(#isValid, or: $value.isValid),
    isSignup: data.get(#isSignup, or: $value.isSignup),
    message: data.get(#message, or: $value.message),
  );

  @override
  LoginStateCopyWith<$R2, LoginState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _LoginStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

