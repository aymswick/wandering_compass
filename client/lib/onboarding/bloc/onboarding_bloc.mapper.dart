// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'onboarding_bloc.dart';

class OnboardingStateMapper extends ClassMapperBase<OnboardingState> {
  OnboardingStateMapper._();

  static OnboardingStateMapper? _instance;
  static OnboardingStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OnboardingStateMapper._());
      ScheduleMapper.ensureInitialized();
      ZoneMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OnboardingState';

  static OnboardingStatus _$status(OnboardingState v) => v.status;
  static const Field<OnboardingState, OnboardingStatus> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: OnboardingStatus.intial,
  );
  static Schedule? _$schedule(OnboardingState v) => v.schedule;
  static const Field<OnboardingState, Schedule> _f$schedule = Field(
    'schedule',
    _$schedule,
    opt: true,
  );
  static List<Zone> _$zones(OnboardingState v) => v.zones;
  static const Field<OnboardingState, List<Zone>> _f$zones = Field(
    'zones',
    _$zones,
    opt: true,
    def: const [
      Zone(name: 'Open'),
      Zone(name: 'Work'),
      Zone(name: 'Close'),
    ],
  );
  static String? _$message(OnboardingState v) => v.message;
  static const Field<OnboardingState, String> _f$message = Field(
    'message',
    _$message,
    opt: true,
  );

  @override
  final MappableFields<OnboardingState> fields = const {
    #status: _f$status,
    #schedule: _f$schedule,
    #zones: _f$zones,
    #message: _f$message,
  };

  static OnboardingState _instantiate(DecodingData data) {
    return OnboardingState(
      status: data.dec(_f$status),
      schedule: data.dec(_f$schedule),
      zones: data.dec(_f$zones),
      message: data.dec(_f$message),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static OnboardingState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OnboardingState>(map);
  }

  static OnboardingState fromJson(String json) {
    return ensureInitialized().decodeJson<OnboardingState>(json);
  }
}

mixin OnboardingStateMappable {
  String toJson() {
    return OnboardingStateMapper.ensureInitialized()
        .encodeJson<OnboardingState>(this as OnboardingState);
  }

  Map<String, dynamic> toMap() {
    return OnboardingStateMapper.ensureInitialized().encodeMap<OnboardingState>(
      this as OnboardingState,
    );
  }

  OnboardingStateCopyWith<OnboardingState, OnboardingState, OnboardingState>
  get copyWith =>
      _OnboardingStateCopyWithImpl<OnboardingState, OnboardingState>(
        this as OnboardingState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OnboardingStateMapper.ensureInitialized().stringifyValue(
      this as OnboardingState,
    );
  }

  @override
  bool operator ==(Object other) {
    return OnboardingStateMapper.ensureInitialized().equalsValue(
      this as OnboardingState,
      other,
    );
  }

  @override
  int get hashCode {
    return OnboardingStateMapper.ensureInitialized().hashValue(
      this as OnboardingState,
    );
  }
}

extension OnboardingStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, OnboardingState, $Out> {
  OnboardingStateCopyWith<$R, OnboardingState, $Out> get $asOnboardingState =>
      $base.as((v, t, t2) => _OnboardingStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OnboardingStateCopyWith<$R, $In extends OnboardingState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ScheduleCopyWith<$R, Schedule, Schedule>? get schedule;
  ListCopyWith<$R, Zone, ZoneCopyWith<$R, Zone, Zone>> get zones;
  $R call({
    OnboardingStatus? status,
    Schedule? schedule,
    List<Zone>? zones,
    String? message,
  });
  OnboardingStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _OnboardingStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, OnboardingState, $Out>
    implements OnboardingStateCopyWith<$R, OnboardingState, $Out> {
  _OnboardingStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<OnboardingState> $mapper =
      OnboardingStateMapper.ensureInitialized();
  @override
  ScheduleCopyWith<$R, Schedule, Schedule>? get schedule =>
      $value.schedule?.copyWith.$chain((v) => call(schedule: v));
  @override
  ListCopyWith<$R, Zone, ZoneCopyWith<$R, Zone, Zone>> get zones =>
      ListCopyWith(
        $value.zones,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(zones: v),
      );
  @override
  $R call({
    OnboardingStatus? status,
    Object? schedule = $none,
    List<Zone>? zones,
    Object? message = $none,
  }) => $apply(
    FieldCopyWithData({
      if (status != null) #status: status,
      if (schedule != $none) #schedule: schedule,
      if (zones != null) #zones: zones,
      if (message != $none) #message: message,
    }),
  );
  @override
  OnboardingState $make(CopyWithData data) => OnboardingState(
    status: data.get(#status, or: $value.status),
    schedule: data.get(#schedule, or: $value.schedule),
    zones: data.get(#zones, or: $value.zones),
    message: data.get(#message, or: $value.message),
  );

  @override
  OnboardingStateCopyWith<$R2, OnboardingState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OnboardingStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

