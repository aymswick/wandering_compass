// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'result.dart';

class FailureMapper extends SubClassMapperBase<Failure> {
  FailureMapper._();

  static FailureMapper? _instance;
  static FailureMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Exception>();
      MapperContainer.globals.use(_instance = FailureMapper._());
      ResultMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Failure';
  @override
  Function get typeFactory =>
      <S, E extends Exception>(f) => f<Failure<S, E>>();

  static Exception _$exception(Failure v) => v.exception;
  static dynamic _arg$exception<S, E extends Exception>(f) => f<E>();
  static const Field<Failure, Exception> _f$exception = Field(
    'exception',
    _$exception,
    arg: _arg$exception,
  );

  @override
  final MappableFields<Failure> fields = const {#exception: _f$exception};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Failure';
  @override
  late final ClassMapperBase superMapper = ResultMapper.ensureInitialized();

  static Failure<S, E> _instantiate<S, E extends Exception>(DecodingData data) {
    return Failure(data.dec(_f$exception));
  }

  @override
  final Function instantiate = _instantiate;

  static Failure<S, E> fromMap<S, E extends Exception>(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<Failure<S, E>>(map);
  }

  static Failure<S, E> fromJson<S, E extends Exception>(String json) {
    return ensureInitialized().decodeJson<Failure<S, E>>(json);
  }
}

mixin FailureMappable<S, E extends Exception> {
  String toJson() {
    return FailureMapper.ensureInitialized().encodeJson<Failure<S, E>>(
      this as Failure<S, E>,
    );
  }

  Map<String, dynamic> toMap() {
    return FailureMapper.ensureInitialized().encodeMap<Failure<S, E>>(
      this as Failure<S, E>,
    );
  }

  FailureCopyWith<Failure<S, E>, Failure<S, E>, Failure<S, E>, S, E>
  get copyWith => _FailureCopyWithImpl<Failure<S, E>, Failure<S, E>, S, E>(
    this as Failure<S, E>,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return FailureMapper.ensureInitialized().stringifyValue(
      this as Failure<S, E>,
    );
  }

  @override
  bool operator ==(Object other) {
    return FailureMapper.ensureInitialized().equalsValue(
      this as Failure<S, E>,
      other,
    );
  }

  @override
  int get hashCode {
    return FailureMapper.ensureInitialized().hashValue(this as Failure<S, E>);
  }
}

extension FailureValueCopy<$R, $Out, S, E extends Exception>
    on ObjectCopyWith<$R, Failure<S, E>, $Out> {
  FailureCopyWith<$R, Failure<S, E>, $Out, S, E> get $asFailure =>
      $base.as((v, t, t2) => _FailureCopyWithImpl<$R, $Out, S, E>(v, t, t2));
}

abstract class FailureCopyWith<
  $R,
  $In extends Failure<S, E>,
  $Out,
  S,
  E extends Exception
>
    implements ResultCopyWith<$R, $In, $Out, S, E> {
  @override
  $R call({E? exception});
  FailureCopyWith<$R2, $In, $Out2, S, E> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FailureCopyWithImpl<$R, $Out, S, E extends Exception>
    extends ClassCopyWithBase<$R, Failure<S, E>, $Out>
    implements FailureCopyWith<$R, Failure<S, E>, $Out, S, E> {
  _FailureCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Failure> $mapper =
      FailureMapper.ensureInitialized();
  @override
  $R call({E? exception}) =>
      $apply(FieldCopyWithData({if (exception != null) #exception: exception}));
  @override
  Failure<S, E> $make(CopyWithData data) =>
      Failure(data.get(#exception, or: $value.exception));

  @override
  FailureCopyWith<$R2, Failure<S, E>, $Out2, S, E> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FailureCopyWithImpl<$R2, $Out2, S, E>($value, $cast, t);
}

class ResultMapper extends ClassMapperBase<Result> {
  ResultMapper._();

  static ResultMapper? _instance;
  static ResultMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Exception>();
      MapperContainer.globals.use(_instance = ResultMapper._());
      FailureMapper.ensureInitialized();
      SuccessMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Result';
  @override
  Function get typeFactory =>
      <S, E extends Exception>(f) => f<Result<S, E>>();

  @override
  final MappableFields<Result> fields = const {};

  static Result<S, E> _instantiate<S, E extends Exception>(DecodingData data) {
    throw MapperException.missingSubclass(
      'Result',
      'type',
      '${data.value['type']}',
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Result<S, E> fromMap<S, E extends Exception>(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<Result<S, E>>(map);
  }

  static Result<S, E> fromJson<S, E extends Exception>(String json) {
    return ensureInitialized().decodeJson<Result<S, E>>(json);
  }
}

mixin ResultMappable<S, E extends Exception> {
  String toJson();
  Map<String, dynamic> toMap();
  ResultCopyWith<Result<S, E>, Result<S, E>, Result<S, E>, S, E> get copyWith;
}

abstract class ResultCopyWith<
  $R,
  $In extends Result<S, E>,
  $Out,
  S,
  E extends Exception
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ResultCopyWith<$R2, $In, $Out2, S, E> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class SuccessMapper extends SubClassMapperBase<Success> {
  SuccessMapper._();

  static SuccessMapper? _instance;
  static SuccessMapper ensureInitialized() {
    if (_instance == null) {
      MapperBase.addType<Exception>();
      MapperContainer.globals.use(_instance = SuccessMapper._());
      ResultMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'Success';
  @override
  Function get typeFactory =>
      <S, E extends Exception>(f) => f<Success<S, E>>();

  static dynamic _$value(Success v) => v.value;
  static dynamic _arg$value<S, E extends Exception>(f) => f<S>();
  static const Field<Success, dynamic> _f$value = Field(
    'value',
    _$value,
    arg: _arg$value,
  );

  @override
  final MappableFields<Success> fields = const {#value: _f$value};

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'Success';
  @override
  late final ClassMapperBase superMapper = ResultMapper.ensureInitialized();

  static Success<S, E> _instantiate<S, E extends Exception>(DecodingData data) {
    return Success(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static Success<S, E> fromMap<S, E extends Exception>(
    Map<String, dynamic> map,
  ) {
    return ensureInitialized().decodeMap<Success<S, E>>(map);
  }

  static Success<S, E> fromJson<S, E extends Exception>(String json) {
    return ensureInitialized().decodeJson<Success<S, E>>(json);
  }
}

mixin SuccessMappable<S, E extends Exception> {
  String toJson() {
    return SuccessMapper.ensureInitialized().encodeJson<Success<S, E>>(
      this as Success<S, E>,
    );
  }

  Map<String, dynamic> toMap() {
    return SuccessMapper.ensureInitialized().encodeMap<Success<S, E>>(
      this as Success<S, E>,
    );
  }

  SuccessCopyWith<Success<S, E>, Success<S, E>, Success<S, E>, S, E>
  get copyWith => _SuccessCopyWithImpl<Success<S, E>, Success<S, E>, S, E>(
    this as Success<S, E>,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return SuccessMapper.ensureInitialized().stringifyValue(
      this as Success<S, E>,
    );
  }

  @override
  bool operator ==(Object other) {
    return SuccessMapper.ensureInitialized().equalsValue(
      this as Success<S, E>,
      other,
    );
  }

  @override
  int get hashCode {
    return SuccessMapper.ensureInitialized().hashValue(this as Success<S, E>);
  }
}

extension SuccessValueCopy<$R, $Out, S, E extends Exception>
    on ObjectCopyWith<$R, Success<S, E>, $Out> {
  SuccessCopyWith<$R, Success<S, E>, $Out, S, E> get $asSuccess =>
      $base.as((v, t, t2) => _SuccessCopyWithImpl<$R, $Out, S, E>(v, t, t2));
}

abstract class SuccessCopyWith<
  $R,
  $In extends Success<S, E>,
  $Out,
  S,
  E extends Exception
>
    implements ResultCopyWith<$R, $In, $Out, S, E> {
  @override
  $R call({S? value});
  SuccessCopyWith<$R2, $In, $Out2, S, E> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SuccessCopyWithImpl<$R, $Out, S, E extends Exception>
    extends ClassCopyWithBase<$R, Success<S, E>, $Out>
    implements SuccessCopyWith<$R, Success<S, E>, $Out, S, E> {
  _SuccessCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Success> $mapper =
      SuccessMapper.ensureInitialized();
  @override
  $R call({Object? value = $none}) =>
      $apply(FieldCopyWithData({if (value != $none) #value: value}));
  @override
  Success<S, E> $make(CopyWithData data) =>
      Success(data.get(#value, or: $value.value));

  @override
  SuccessCopyWith<$R2, Success<S, E>, $Out2, S, E> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _SuccessCopyWithImpl<$R2, $Out2, S, E>($value, $cast, t);
}

