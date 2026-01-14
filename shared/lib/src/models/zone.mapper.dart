// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'zone.dart';

class ZoneMapper extends ClassMapperBase<Zone> {
  ZoneMapper._();

  static ZoneMapper? _instance;
  static ZoneMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ZoneMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Zone';

  static String? _$id(Zone v) => v.id;
  static const Field<Zone, String> _f$id = Field('id', _$id, opt: true);
  static String _$name(Zone v) => v.name;
  static const Field<Zone, String> _f$name = Field('name', _$name);
  static DateTime? _$start(Zone v) => v.start;
  static const Field<Zone, DateTime> _f$start = Field(
    'start',
    _$start,
    opt: true,
  );
  static DateTime? _$end(Zone v) => v.end;
  static const Field<Zone, DateTime> _f$end = Field('end', _$end, opt: true);

  @override
  final MappableFields<Zone> fields = const {
    #id: _f$id,
    #name: _f$name,
    #start: _f$start,
    #end: _f$end,
  };

  static Zone _instantiate(DecodingData data) {
    return Zone(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      start: data.dec(_f$start),
      end: data.dec(_f$end),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Zone fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Zone>(map);
  }

  static Zone fromJson(String json) {
    return ensureInitialized().decodeJson<Zone>(json);
  }
}

mixin ZoneMappable {
  String toJson() {
    return ZoneMapper.ensureInitialized().encodeJson<Zone>(this as Zone);
  }

  Map<String, dynamic> toMap() {
    return ZoneMapper.ensureInitialized().encodeMap<Zone>(this as Zone);
  }

  ZoneCopyWith<Zone, Zone, Zone> get copyWith =>
      _ZoneCopyWithImpl<Zone, Zone>(this as Zone, $identity, $identity);
  @override
  String toString() {
    return ZoneMapper.ensureInitialized().stringifyValue(this as Zone);
  }

  @override
  bool operator ==(Object other) {
    return ZoneMapper.ensureInitialized().equalsValue(this as Zone, other);
  }

  @override
  int get hashCode {
    return ZoneMapper.ensureInitialized().hashValue(this as Zone);
  }
}

extension ZoneValueCopy<$R, $Out> on ObjectCopyWith<$R, Zone, $Out> {
  ZoneCopyWith<$R, Zone, $Out> get $asZone =>
      $base.as((v, t, t2) => _ZoneCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ZoneCopyWith<$R, $In extends Zone, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? name, DateTime? start, DateTime? end});
  ZoneCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ZoneCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Zone, $Out>
    implements ZoneCopyWith<$R, Zone, $Out> {
  _ZoneCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Zone> $mapper = ZoneMapper.ensureInitialized();
  @override
  $R call({
    Object? id = $none,
    String? name,
    Object? start = $none,
    Object? end = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (start != $none) #start: start,
      if (end != $none) #end: end,
    }),
  );
  @override
  Zone $make(CopyWithData data) => Zone(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    start: data.get(#start, or: $value.start),
    end: data.get(#end, or: $value.end),
  );

  @override
  ZoneCopyWith<$R2, Zone, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ZoneCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

