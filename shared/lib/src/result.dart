import 'package:dart_mappable/dart_mappable.dart';

part 'result.mapper.dart';

@MappableClass()
class Failure<S, E extends Exception> extends Result<S, E>
    with FailureMappable {
  static final fromJson = FailureMapper.fromJson;
  static final fromMap = FailureMapper.fromMap;
  final E exception;

  Failure(this.exception);
}

/// Wrapper used across frontend + backend
@MappableClass(discriminatorKey: 'type')
sealed class Result<S, E extends Exception> {}

@MappableClass()
class Success<S, E extends Exception> extends Result<S, E>
    with SuccessMappable {
  static final fromJson = SuccessMapper.fromJson;
  static final fromMap = SuccessMapper.fromMap;

  final S value;

  Success(this.value);
}
