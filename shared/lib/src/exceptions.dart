import 'package:dart_mappable/dart_mappable.dart';

part 'exceptions.mapper.dart';

@MappableClass()
class ObjectCreateException
    with ObjectCreateExceptionMappable
    implements Exception {
  final String objectName;
  ObjectCreateException(this.objectName);

  @override
  String toString() {
    return 'Failed to create $objectName; ${super.toString()}';
  }
}

@MappableClass()
class ObjectDeleteException
    with ObjectDeleteExceptionMappable
    implements Exception {
  final String objectName;
  ObjectDeleteException(this.objectName);

  @override
  String toString() {
    return 'Failed to delete $objectName';
  }
}

@MappableClass()
class ObjectFetchException
    with ObjectFetchExceptionMappable
    implements Exception {
  final String objectName;
  ObjectFetchException(this.objectName);

  @override
  String toString() {
    return 'Failed to fetch $objectName';
  }
}
