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
        ModelRepositoryInsert<ScheduleInsertRequest>,
        ModelRepositoryUpdate<ScheduleUpdateRequest>,
        ModelRepositoryDelete<String> {
  factory ScheduleRepository._(Session db) = _ScheduleRepository;

  Future<ScheduleView?> querySchedule(String id);
  Future<List<ScheduleView>> querySchedules([QueryParams? params]);
}

class _ScheduleRepository extends BaseRepository
    with
        RepositoryInsertMixin<ScheduleInsertRequest>,
        RepositoryUpdateMixin<ScheduleUpdateRequest>,
        RepositoryDeleteMixin<String>
    implements ScheduleRepository {
  _ScheduleRepository(super.db) : super(tableName: 'schedules', keyName: 'id');

  @override
  Future<ScheduleView?> querySchedule(String id) {
    return queryOne(id, ScheduleViewQueryable());
  }

  @override
  Future<List<ScheduleView>> querySchedules([QueryParams? params]) {
    return queryMany(ScheduleViewQueryable(), params);
  }

  @override
  Future<void> insert(List<ScheduleInsertRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.execute(
      Sql.named(
        'INSERT INTO "schedules" ( "id", "name" )\n'
        'VALUES ${requests.map((r) => '( ${values.add(r.id)}:text, ${values.add(r.name)}:text )').join(', ')}\n',
      ),
      parameters: values.values,
    );
  }

  @override
  Future<void> update(List<ScheduleUpdateRequest> requests) async {
    if (requests.isEmpty) return;

    final updateRequests = [
      for (final r in requests)
        if (r.name != null) r,
    ];

    if (updateRequests.isNotEmpty) {
      var values = QueryValues();
      await db.execute(
        Sql.named(
          'UPDATE "schedules"\n'
          'SET "name" = COALESCE(UPDATED."name", "schedules"."name")\n'
          'FROM ( VALUES ${updateRequests.map((r) => '( ${values.add(r.id)}:text::text, ${values.add(r.name)}:text::text )').join(', ')} )\n'
          'AS UPDATED("id", "name")\n'
          'WHERE "schedules"."id" = UPDATED."id"',
        ),
        parameters: values.values,
      );
    }
  }
}

class ScheduleInsertRequest {
  ScheduleInsertRequest({required this.id, required this.name});

  final String id;
  final String name;
}

class ScheduleUpdateRequest {
  ScheduleUpdateRequest({required this.id, this.name});

  final String id;
  final String? name;
}

class ScheduleViewQueryable extends KeyedViewQueryable<ScheduleView, String> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(String key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "schedules".*'
      'FROM "schedules"';

  @override
  String get tableAlias => 'schedules';

  @override
  ScheduleView decode(TypedMap map) =>
      ScheduleView(id: map.get('id'), name: map.get('name'));
}

class ScheduleView {
  ScheduleView({required this.id, required this.name});

  final String id;
  final String name;
}
