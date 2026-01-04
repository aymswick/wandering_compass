// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// ignore_for_file: annotate_overrides
// dart format off

part of 'zone.dart';

extension ZoneRepositories on Session {
  ZoneRepository get zones => ZoneRepository._(this);
}

abstract class ZoneRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<ZoneInsertRequest>,
        ModelRepositoryUpdate<ZoneUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory ZoneRepository._(Session db) = _ZoneRepository;

  Future<ZoneView?> queryZone(int id);
  Future<List<ZoneView>> queryZones([QueryParams? params]);
}

class _ZoneRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<ZoneInsertRequest>,
        RepositoryUpdateMixin<ZoneUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements ZoneRepository {
  _ZoneRepository(super.db) : super(tableName: 'zones', keyName: 'id');

  @override
  Future<ZoneView?> queryZone(int id) {
    return queryOne(id, ZoneViewQueryable());
  }

  @override
  Future<List<ZoneView>> queryZones([QueryParams? params]) {
    return queryMany(ZoneViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<ZoneInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.execute(
      Sql.named(
        'INSERT INTO "zones" ( "footholds", "name", "start", "stop" )\n'
        'VALUES ${requests.map((r) => '( ${values.add(r.footholds)}:_text, ${values.add(r.name)}:text, ${values.add(r.start)}:timestamp, ${values.add(r.stop)}:timestamp )').join(', ')}\n'
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
  Future<void> update(List<ZoneUpdateRequest> requests) async {
    if (requests.isEmpty) return;

    final updateRequests = [
      for (final r in requests)
        if (r.footholds != null ||
            r.name != null ||
            r.start != null ||
            r.stop != null)
          r,
    ];

    if (updateRequests.isNotEmpty) {
      var values = QueryValues();
      await db.execute(
        Sql.named(
          'UPDATE "zones"\n'
          'SET "footholds" = COALESCE(UPDATED."footholds", "zones"."footholds"), "name" = COALESCE(UPDATED."name", "zones"."name"), "start" = COALESCE(UPDATED."start", "zones"."start"), "stop" = COALESCE(UPDATED."stop", "zones"."stop")\n'
          'FROM ( VALUES ${updateRequests.map((r) => '( ${values.add(r.footholds)}:_text::_text, ${values.add(r.id)}:int8::int8, ${values.add(r.name)}:text::text, ${values.add(r.start)}:timestamp::timestamp, ${values.add(r.stop)}:timestamp::timestamp )').join(', ')} )\n'
          'AS UPDATED("footholds", "id", "name", "start", "stop")\n'
          'WHERE "zones"."id" = UPDATED."id"',
        ),
        parameters: values.values,
      );
    }
  }
}

class ZoneInsertRequest {
  ZoneInsertRequest({
    required this.footholds,
    required this.name,
    required this.start,
    required this.stop,
  });

  final List<String> footholds;
  final String name;
  final DateTime start;
  final DateTime stop;
}

class ZoneUpdateRequest {
  ZoneUpdateRequest({
    this.footholds,
    required this.id,
    this.name,
    this.start,
    this.stop,
  });

  final List<String>? footholds;
  final int id;
  final String? name;
  final DateTime? start;
  final DateTime? stop;
}

class ZoneViewQueryable extends KeyedViewQueryable<ZoneView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "zones".*'
      'FROM "zones"';

  @override
  String get tableAlias => 'zones';

  @override
  ZoneView decode(TypedMap map) => ZoneView(
    footholds: map.getListOpt('footholds') ?? const [],
    id: map.get('id'),
    name: map.get('name'),
    start: map.get('start'),
    stop: map.get('stop'),
  );
}

class ZoneView {
  ZoneView({
    required this.footholds,
    required this.id,
    required this.name,
    required this.start,
    required this.stop,
  });

  final List<String> footholds;
  final int id;
  final String name;
  final DateTime start;
  final DateTime stop;
}
