// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'schedule.dart';

class ScheduleMapper extends ClassMapperBase<Schedule> {
  ScheduleMapper._();

  static ScheduleMapper? _instance;
  static ScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScheduleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Schedule';

  static int? _$id(Schedule v) => v.id;
  static const Field<Schedule, int> _f$id = Field('id', _$id, opt: true);
  static String _$name(Schedule v) => v.name;
  static const Field<Schedule, String> _f$name = Field('name', _$name);
  static int? _$workingHours(Schedule v) => v.workingHours;
  static const Field<Schedule, int> _f$workingHours = Field(
    'workingHours',
    _$workingHours,
    opt: true,
  );
  static List<String> _$footholds(Schedule v) => v.footholds;
  static const Field<Schedule, List<String>> _f$footholds = Field(
    'footholds',
    _$footholds,
    opt: true,
    def: const [],
  );
  static List<String> _$zones(Schedule v) => v.zones;
  static const Field<Schedule, List<String>> _f$zones = Field(
    'zones',
    _$zones,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<Schedule> fields = const {
    #id: _f$id,
    #name: _f$name,
    #workingHours: _f$workingHours,
    #footholds: _f$footholds,
    #zones: _f$zones,
  };

  static Schedule _instantiate(DecodingData data) {
    return Schedule(
      id: data.dec(_f$id),
      name: data.dec(_f$name),
      workingHours: data.dec(_f$workingHours),
      footholds: data.dec(_f$footholds),
      zones: data.dec(_f$zones),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Schedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Schedule>(map);
  }

  static Schedule fromJson(String json) {
    return ensureInitialized().decodeJson<Schedule>(json);
  }
}

mixin ScheduleMappable {
  String toJson() {
    return ScheduleMapper.ensureInitialized().encodeJson<Schedule>(
      this as Schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return ScheduleMapper.ensureInitialized().encodeMap<Schedule>(
      this as Schedule,
    );
  }

  ScheduleCopyWith<Schedule, Schedule, Schedule> get copyWith =>
      _ScheduleCopyWithImpl<Schedule, Schedule>(
        this as Schedule,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ScheduleMapper.ensureInitialized().stringifyValue(this as Schedule);
  }

  @override
  bool operator ==(Object other) {
    return ScheduleMapper.ensureInitialized().equalsValue(
      this as Schedule,
      other,
    );
  }

  @override
  int get hashCode {
    return ScheduleMapper.ensureInitialized().hashValue(this as Schedule);
  }
}

extension ScheduleValueCopy<$R, $Out> on ObjectCopyWith<$R, Schedule, $Out> {
  ScheduleCopyWith<$R, Schedule, $Out> get $asSchedule =>
      $base.as((v, t, t2) => _ScheduleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ScheduleCopyWith<$R, $In extends Schedule, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get footholds;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get zones;
  $R call({
    int? id,
    String? name,
    int? workingHours,
    List<String>? footholds,
    List<String>? zones,
  });
  ScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Schedule, $Out>
    implements ScheduleCopyWith<$R, Schedule, $Out> {
  _ScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Schedule> $mapper =
      ScheduleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get footholds =>
      ListCopyWith(
        $value.footholds,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(footholds: v),
      );
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get zones =>
      ListCopyWith(
        $value.zones,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(zones: v),
      );
  @override
  $R call({
    Object? id = $none,
    String? name,
    Object? workingHours = $none,
    List<String>? footholds,
    List<String>? zones,
  }) => $apply(
    FieldCopyWithData({
      if (id != $none) #id: id,
      if (name != null) #name: name,
      if (workingHours != $none) #workingHours: workingHours,
      if (footholds != null) #footholds: footholds,
      if (zones != null) #zones: zones,
    }),
  );
  @override
  Schedule $make(CopyWithData data) => Schedule(
    id: data.get(#id, or: $value.id),
    name: data.get(#name, or: $value.name),
    workingHours: data.get(#workingHours, or: $value.workingHours),
    footholds: data.get(#footholds, or: $value.footholds),
    zones: data.get(#zones, or: $value.zones),
  );

  @override
  ScheduleCopyWith<$R2, Schedule, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

