// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'today_bloc.dart';

class TodayStateMapper extends ClassMapperBase<TodayState> {
  TodayStateMapper._();

  static TodayStateMapper? _instance;
  static TodayStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TodayStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'TodayState';

  static double _$currentTick(TodayState v) => v.currentTick;
  static const Field<TodayState, double> _f$currentTick = Field(
    'currentTick',
    _$currentTick,
  );

  @override
  final MappableFields<TodayState> fields = const {
    #currentTick: _f$currentTick,
  };

  static TodayState _instantiate(DecodingData data) {
    return TodayState(currentTick: data.dec(_f$currentTick));
  }

  @override
  final Function instantiate = _instantiate;

  static TodayState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TodayState>(map);
  }

  static TodayState fromJson(String json) {
    return ensureInitialized().decodeJson<TodayState>(json);
  }
}

mixin TodayStateMappable {
  String toJson() {
    return TodayStateMapper.ensureInitialized().encodeJson<TodayState>(
      this as TodayState,
    );
  }

  Map<String, dynamic> toMap() {
    return TodayStateMapper.ensureInitialized().encodeMap<TodayState>(
      this as TodayState,
    );
  }

  TodayStateCopyWith<TodayState, TodayState, TodayState> get copyWith =>
      _TodayStateCopyWithImpl<TodayState, TodayState>(
        this as TodayState,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TodayStateMapper.ensureInitialized().stringifyValue(
      this as TodayState,
    );
  }

  @override
  bool operator ==(Object other) {
    return TodayStateMapper.ensureInitialized().equalsValue(
      this as TodayState,
      other,
    );
  }

  @override
  int get hashCode {
    return TodayStateMapper.ensureInitialized().hashValue(this as TodayState);
  }
}

extension TodayStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TodayState, $Out> {
  TodayStateCopyWith<$R, TodayState, $Out> get $asTodayState =>
      $base.as((v, t, t2) => _TodayStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TodayStateCopyWith<$R, $In extends TodayState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({double? currentTick});
  TodayStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TodayStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TodayState, $Out>
    implements TodayStateCopyWith<$R, TodayState, $Out> {
  _TodayStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TodayState> $mapper =
      TodayStateMapper.ensureInitialized();
  @override
  $R call({double? currentTick}) => $apply(
    FieldCopyWithData({if (currentTick != null) #currentTick: currentTick}),
  );
  @override
  TodayState $make(CopyWithData data) =>
      TodayState(currentTick: data.get(#currentTick, or: $value.currentTick));

  @override
  TodayStateCopyWith<$R2, TodayState, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TodayStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

