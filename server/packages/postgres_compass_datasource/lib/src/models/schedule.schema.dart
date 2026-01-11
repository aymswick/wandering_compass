// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// ignore_for_file: annotate_overrides
// dart format off

part of 'schedule.dart';

extension ScheduleRepositories on Session {
  ScheduleRepository get schedules => ScheduleRepository._(this);
}

abstract class ScheduleRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<ScheduleInsertRequest>,
        ModelRepositoryUpdate<ScheduleUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory ScheduleRepository._(Session db) = _ScheduleRepository;

  Future<ScheduleView?> querySchedule(int id);
  Future<List<ScheduleView>> querySchedules([QueryParams? params]);
}

class _ScheduleRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<ScheduleInsertRequest>,
        RepositoryUpdateMixin<ScheduleUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements ScheduleRepository {
  _ScheduleRepository(super.db) : super(tableName: 'schedules', keyName: 'id');

  @override
  Future<ScheduleView?> querySchedule(int id) {
    return queryOne(id, ScheduleViewQueryable());
  }

  @override
  Future<List<ScheduleView>> querySchedules([QueryParams? params]) {
    return queryMany(ScheduleViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<ScheduleInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.execute(
      Sql.named(
        'INSERT INTO "schedules" ( "day_end", "day_start", "footholds", "name", "zones" )\n'
        'VALUES ${requests.map((r) => '( ${values.add(r.dayEnd)}:timestamp, ${values.add(r.dayStart)}:timestamp, ${values.add(r.footholds)}:_text, ${values.add(r.name)}:text, ${values.add(r.zones)}:_text )').join(', ')}\n'
        'RETURNING "id"',
      ),
      parameters: values.values,
    );
    var result = rows
        .map<int>((r) => TextEncoder.i.decode(r.toColumnMap()['id']))
        .toList();

    return result;
  }

  @override
  Future<void> update(List<ScheduleUpdateRequest> requests) async {
    if (requests.isEmpty) return;

    final updateRequests = [
      for (final r in requests)
        if (r.dayEnd != null ||
            r.dayStart != null ||
            r.footholds != null ||
            r.name != null ||
            r.zones != null)
          r,
    ];

    if (updateRequests.isNotEmpty) {
      var values = QueryValues();
      await db.execute(
        Sql.named(
          'UPDATE "schedules"\n'
          'SET "day_end" = COALESCE(UPDATED."day_end", "schedules"."day_end"), "day_start" = COALESCE(UPDATED."day_start", "schedules"."day_start"), "footholds" = COALESCE(UPDATED."footholds", "schedules"."footholds"), "name" = COALESCE(UPDATED."name", "schedules"."name"), "zones" = COALESCE(UPDATED."zones", "schedules"."zones")\n'
          'FROM ( VALUES ${updateRequests.map((r) => '( ${values.add(r.dayEnd)}:timestamp::timestamp, ${values.add(r.dayStart)}:timestamp::timestamp, ${values.add(r.footholds)}:_text::_text, ${values.add(r.id)}:int8::int8, ${values.add(r.name)}:text::text, ${values.add(r.zones)}:_text::_text )').join(', ')} )\n'
          'AS UPDATED("day_end", "day_start", "footholds", "id", "name", "zones")\n'
          'WHERE "schedules"."id" = UPDATED."id"',
        ),
        parameters: values.values,
      );
    }
  }
}

class ScheduleInsertRequest {
  ScheduleInsertRequest({
    required this.dayEnd,
    required this.dayStart,
    required this.footholds,
    required this.name,
    this.zones,
  });

  final DateTime dayEnd;
  final DateTime dayStart;
  final List<String> footholds;
  final String name;
  final List<String>? zones;
}

class ScheduleUpdateRequest {
  ScheduleUpdateRequest({
    this.dayEnd,
    this.dayStart,
    this.footholds,
    required this.id,
    this.name,
    this.zones,
  });

  final DateTime? dayEnd;
  final DateTime? dayStart;
  final List<String>? footholds;
  final int id;
  final String? name;
  final List<String>? zones;
}

class ScheduleViewQueryable extends KeyedViewQueryable<ScheduleView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "schedules".*'
      'FROM "schedules"';

  @override
  String get tableAlias => 'schedules';

  @override
  ScheduleView decode(TypedMap map) => ScheduleView(
    dayEnd: map.get('day_end'),
    dayStart: map.get('day_start'),
    footholds: map.getListOpt('footholds') ?? const [],
    id: map.get('id'),
    name: map.get('name'),
    zones: map.getListOpt('zones'),
  );
}

class ScheduleView {
  ScheduleView({
    required this.dayEnd,
    required this.dayStart,
    required this.footholds,
    required this.id,
    required this.name,
    this.zones,
  });

  final DateTime dayEnd;
  final DateTime dayStart;
  final List<String> footholds;
  final int id;
  final String name;
  final List<String>? zones;
}
