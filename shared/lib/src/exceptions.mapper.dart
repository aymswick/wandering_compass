// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'exceptions.dart';

class ObjectCreateExceptionMapper
    extends ClassMapperBase<ObjectCreateException> {
  ObjectCreateExceptionMapper._();

  static ObjectCreateExceptionMapper? _instance;
  static ObjectCreateExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ObjectCreateExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ObjectCreateException';

  static String _$objectName(ObjectCreateException v) => v.objectName;
  static const Field<ObjectCreateException, String> _f$objectName = Field(
    'objectName',
    _$objectName,
  );

  @override
  final MappableFields<ObjectCreateException> fields = const {
    #objectName: _f$objectName,
  };

  static ObjectCreateException _instantiate(DecodingData data) {
    return ObjectCreateException(data.dec(_f$objectName));
  }

  @override
  final Function instantiate = _instantiate;

  static ObjectCreateException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ObjectCreateException>(map);
  }

  static ObjectCreateException fromJson(String json) {
    return ensureInitialized().decodeJson<ObjectCreateException>(json);
  }
}

mixin ObjectCreateExceptionMappable {
  String toJson() {
    return ObjectCreateExceptionMapper.ensureInitialized()
        .encodeJson<ObjectCreateException>(this as ObjectCreateException);
  }

  Map<String, dynamic> toMap() {
    return ObjectCreateExceptionMapper.ensureInitialized()
        .encodeMap<ObjectCreateException>(this as ObjectCreateException);
  }

  ObjectCreateExceptionCopyWith<
    ObjectCreateException,
    ObjectCreateException,
    ObjectCreateException
  >
  get copyWith =>
      _ObjectCreateExceptionCopyWithImpl<
        ObjectCreateException,
        ObjectCreateException
      >(this as ObjectCreateException, $identity, $identity);
  @override
  String toString() {
    return ObjectCreateExceptionMapper.ensureInitialized().stringifyValue(
      this as ObjectCreateException,
    );
  }

  @override
  bool operator ==(Object other) {
    return ObjectCreateExceptionMapper.ensureInitialized().equalsValue(
      this as ObjectCreateException,
      other,
    );
  }

  @override
  int get hashCode {
    return ObjectCreateExceptionMapper.ensureInitialized().hashValue(
      this as ObjectCreateException,
    );
  }
}

extension ObjectCreateExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ObjectCreateException, $Out> {
  ObjectCreateExceptionCopyWith<$R, ObjectCreateException, $Out>
  get $asObjectCreateException => $base.as(
    (v, t, t2) => _ObjectCreateExceptionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ObjectCreateExceptionCopyWith<
  $R,
  $In extends ObjectCreateException,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? objectName});
  ObjectCreateExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ObjectCreateExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ObjectCreateException, $Out>
    implements ObjectCreateExceptionCopyWith<$R, ObjectCreateException, $Out> {
  _ObjectCreateExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ObjectCreateException> $mapper =
      ObjectCreateExceptionMapper.ensureInitialized();
  @override
  $R call({String? objectName}) => $apply(
    FieldCopyWithData({if (objectName != null) #objectName: objectName}),
  );
  @override
  ObjectCreateException $make(CopyWithData data) =>
      ObjectCreateException(data.get(#objectName, or: $value.objectName));

  @override
  ObjectCreateExceptionCopyWith<$R2, ObjectCreateException, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ObjectCreateExceptionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ObjectDeleteExceptionMapper
    extends ClassMapperBase<ObjectDeleteException> {
  ObjectDeleteExceptionMapper._();

  static ObjectDeleteExceptionMapper? _instance;
  static ObjectDeleteExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ObjectDeleteExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ObjectDeleteException';

  static String _$objectName(ObjectDeleteException v) => v.objectName;
  static const Field<ObjectDeleteException, String> _f$objectName = Field(
    'objectName',
    _$objectName,
  );

  @override
  final MappableFields<ObjectDeleteException> fields = const {
    #objectName: _f$objectName,
  };

  static ObjectDeleteException _instantiate(DecodingData data) {
    return ObjectDeleteException(data.dec(_f$objectName));
  }

  @override
  final Function instantiate = _instantiate;

  static ObjectDeleteException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ObjectDeleteException>(map);
  }

  static ObjectDeleteException fromJson(String json) {
    return ensureInitialized().decodeJson<ObjectDeleteException>(json);
  }
}

mixin ObjectDeleteExceptionMappable {
  String toJson() {
    return ObjectDeleteExceptionMapper.ensureInitialized()
        .encodeJson<ObjectDeleteException>(this as ObjectDeleteException);
  }

  Map<String, dynamic> toMap() {
    return ObjectDeleteExceptionMapper.ensureInitialized()
        .encodeMap<ObjectDeleteException>(this as ObjectDeleteException);
  }

  ObjectDeleteExceptionCopyWith<
    ObjectDeleteException,
    ObjectDeleteException,
    ObjectDeleteException
  >
  get copyWith =>
      _ObjectDeleteExceptionCopyWithImpl<
        ObjectDeleteException,
        ObjectDeleteException
      >(this as ObjectDeleteException, $identity, $identity);
  @override
  String toString() {
    return ObjectDeleteExceptionMapper.ensureInitialized().stringifyValue(
      this as ObjectDeleteException,
    );
  }

  @override
  bool operator ==(Object other) {
    return ObjectDeleteExceptionMapper.ensureInitialized().equalsValue(
      this as ObjectDeleteException,
      other,
    );
  }

  @override
  int get hashCode {
    return ObjectDeleteExceptionMapper.ensureInitialized().hashValue(
      this as ObjectDeleteException,
    );
  }
}

extension ObjectDeleteExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ObjectDeleteException, $Out> {
  ObjectDeleteExceptionCopyWith<$R, ObjectDeleteException, $Out>
  get $asObjectDeleteException => $base.as(
    (v, t, t2) => _ObjectDeleteExceptionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ObjectDeleteExceptionCopyWith<
  $R,
  $In extends ObjectDeleteException,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? objectName});
  ObjectDeleteExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ObjectDeleteExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ObjectDeleteException, $Out>
    implements ObjectDeleteExceptionCopyWith<$R, ObjectDeleteException, $Out> {
  _ObjectDeleteExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ObjectDeleteException> $mapper =
      ObjectDeleteExceptionMapper.ensureInitialized();
  @override
  $R call({String? objectName}) => $apply(
    FieldCopyWithData({if (objectName != null) #objectName: objectName}),
  );
  @override
  ObjectDeleteException $make(CopyWithData data) =>
      ObjectDeleteException(data.get(#objectName, or: $value.objectName));

  @override
  ObjectDeleteExceptionCopyWith<$R2, ObjectDeleteException, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ObjectDeleteExceptionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ObjectFetchExceptionMapper extends ClassMapperBase<ObjectFetchException> {
  ObjectFetchExceptionMapper._();

  static ObjectFetchExceptionMapper? _instance;
  static ObjectFetchExceptionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ObjectFetchExceptionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ObjectFetchException';

  static String _$objectName(ObjectFetchException v) => v.objectName;
  static const Field<ObjectFetchException, String> _f$objectName = Field(
    'objectName',
    _$objectName,
  );

  @override
  final MappableFields<ObjectFetchException> fields = const {
    #objectName: _f$objectName,
  };

  static ObjectFetchException _instantiate(DecodingData data) {
    return ObjectFetchException(data.dec(_f$objectName));
  }

  @override
  final Function instantiate = _instantiate;

  static ObjectFetchException fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ObjectFetchException>(map);
  }

  static ObjectFetchException fromJson(String json) {
    return ensureInitialized().decodeJson<ObjectFetchException>(json);
  }
}

mixin ObjectFetchExceptionMappable {
  String toJson() {
    return ObjectFetchExceptionMapper.ensureInitialized()
        .encodeJson<ObjectFetchException>(this as ObjectFetchException);
  }

  Map<String, dynamic> toMap() {
    return ObjectFetchExceptionMapper.ensureInitialized()
        .encodeMap<ObjectFetchException>(this as ObjectFetchException);
  }

  ObjectFetchExceptionCopyWith<
    ObjectFetchException,
    ObjectFetchException,
    ObjectFetchException
  >
  get copyWith =>
      _ObjectFetchExceptionCopyWithImpl<
        ObjectFetchException,
        ObjectFetchException
      >(this as ObjectFetchException, $identity, $identity);
  @override
  String toString() {
    return ObjectFetchExceptionMapper.ensureInitialized().stringifyValue(
      this as ObjectFetchException,
    );
  }

  @override
  bool operator ==(Object other) {
    return ObjectFetchExceptionMapper.ensureInitialized().equalsValue(
      this as ObjectFetchException,
      other,
    );
  }

  @override
  int get hashCode {
    return ObjectFetchExceptionMapper.ensureInitialized().hashValue(
      this as ObjectFetchException,
    );
  }
}

extension ObjectFetchExceptionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ObjectFetchException, $Out> {
  ObjectFetchExceptionCopyWith<$R, ObjectFetchException, $Out>
  get $asObjectFetchException => $base.as(
    (v, t, t2) => _ObjectFetchExceptionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class ObjectFetchExceptionCopyWith<
  $R,
  $In extends ObjectFetchException,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? objectName});
  ObjectFetchExceptionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _ObjectFetchExceptionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ObjectFetchException, $Out>
    implements ObjectFetchExceptionCopyWith<$R, ObjectFetchException, $Out> {
  _ObjectFetchExceptionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ObjectFetchException> $mapper =
      ObjectFetchExceptionMapper.ensureInitialized();
  @override
  $R call({String? objectName}) => $apply(
    FieldCopyWithData({if (objectName != null) #objectName: objectName}),
  );
  @override
  ObjectFetchException $make(CopyWithData data) =>
      ObjectFetchException(data.get(#objectName, or: $value.objectName));

  @override
  ObjectFetchExceptionCopyWith<$R2, ObjectFetchException, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ObjectFetchExceptionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

