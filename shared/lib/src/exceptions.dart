class ObjectCreateException implements Exception {
  ObjectCreateException(this.objectName);
  final String objectName;

  @override
  String toString() {
    return 'Failed to create $objectName';
  }
}

class ObjectDeleteException implements Exception {
  ObjectDeleteException(this.objectName);
  final String objectName;

  @override
  String toString() {
    return 'Failed to delete $objectName';
  }
}

class ObjectFetchException implements Exception {
  ObjectFetchException(this.objectName);
  final String objectName;

  @override
  String toString() {
    return 'Failed to fetch $objectName';
  }
}
