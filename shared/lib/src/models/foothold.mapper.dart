// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'foothold.dart';

class FootholdMapper extends ClassMapperBase<Foothold> {
  FootholdMapper._();

  static FootholdMapper? _instance;
  static FootholdMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FootholdMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Foothold';

  static String? _$id(Foothold v) => v.id;
  static const Field<Foothold, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(Foothold v) => v.name;
  static const Field<Foothold, String> _f$name = Field('name', _$name);

  @override
  final MappableFields<Foothold> fields = const {#id: _f$id, #name: _f$name};

  static Foothold _instantiate(DecodingData data) {
    return Foothold(id: data.dec(_f$id), name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static Foothold fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Foothold>(map);
  }

  static Foothold fromJson(String json) {
    return ensureInitialized().decodeJson<Foothold>(json);
  }
}

mixin FootholdMappable {
  String toJson() {
    return FootholdMapper.ensureInitialized().encodeJson<Foothold>(
      this as Foothold,
    );
  }

  Map<String, dynamic> toMap() {
    return FootholdMapper.ensureInitialized().encodeMap<Foothold>(
      this as Foothold,
    );
  }

  FootholdCopyWith<Foothold, Foothold, Foothold> get copyWith =>
      _FootholdCopyWithImpl<Foothold, Foothold>(
        this as Foothold,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return FootholdMapper.ensureInitialized().stringifyValue(this as Foothold);
  }

  @override
  bool operator ==(Object other) {
    return FootholdMapper.ensureInitialized().equalsValue(
      this as Foothold,
      other,
    );
  }

  @override
  int get hashCode {
    return FootholdMapper.ensureInitialized().hashValue(this as Foothold);
  }
}

extension FootholdValueCopy<$R, $Out> on ObjectCopyWith<$R, Foothold, $Out> {
  FootholdCopyWith<$R, Foothold, $Out> get $asFoothold =>
      $base.as((v, t, t2) => _FootholdCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FootholdCopyWith<$R, $In extends Foothold, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name});
  FootholdCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FootholdCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Foothold, $Out>
    implements FootholdCopyWith<$R, Foothold, $Out> {
  _FootholdCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Foothold> $mapper =
      FootholdMapper.ensureInitialized();
  @override
  $R call({Object? id = $none, String? name}) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
    }),
  );
  @override
  Foothold $make(CopyWithData data) => Foothold(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
  );

  @override
  FootholdCopyWith<$R2, Foothold, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _FootholdCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

