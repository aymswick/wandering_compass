// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// ignore_for_file: annotate_overrides
// dart format off

part of 'foothold.dart';

extension FootholdRepositories on Session {
  FootholdRepository get footholds => FootholdRepository._(this);
}

abstract class FootholdRepository
    implements
        ModelRepository,
        KeyedModelRepositoryInsert<FootholdInsertRequest>,
        ModelRepositoryUpdate<FootholdUpdateRequest>,
        ModelRepositoryDelete<int> {
  factory FootholdRepository._(Session db) = _FootholdRepository;

  Future<FootholdView?> queryFoothold(int id);
  Future<List<FootholdView>> queryFootholds([QueryParams? params]);
}

class _FootholdRepository extends BaseRepository
    with
        KeyedRepositoryInsertMixin<FootholdInsertRequest>,
        RepositoryUpdateMixin<FootholdUpdateRequest>,
        RepositoryDeleteMixin<int>
    implements FootholdRepository {
  _FootholdRepository(super.db) : super(tableName: 'footholds', keyName: 'id');

  @override
  Future<FootholdView?> queryFoothold(int id) {
    return queryOne(id, FootholdViewQueryable());
  }

  @override
  Future<List<FootholdView>> queryFootholds([QueryParams? params]) {
    return queryMany(FootholdViewQueryable(), params);
  }

  @override
  Future<List<int>> insert(List<FootholdInsertRequest> requests) async {
    if (requests.isEmpty) return [];
    var values = QueryValues();
    var rows = await db.execute(
      Sql.named(
        'INSERT INTO "footholds" ( "name" )\n'
        'VALUES ${requests.map((r) => '( ${values.add(r.name)}:text )').join(', ')}\n'
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
  Future<void> update(List<FootholdUpdateRequest> requests) async {
    if (requests.isEmpty) return;

    final updateRequests = [
      for (final r in requests)
        if (r.name != null) r,
    ];

    if (updateRequests.isNotEmpty) {
      var values = QueryValues();
      await db.execute(
        Sql.named(
          'UPDATE "footholds"\n'
          'SET "name" = COALESCE(UPDATED."name", "footholds"."name")\n'
          'FROM ( VALUES ${updateRequests.map((r) => '( ${values.add(r.id)}:int8::int8, ${values.add(r.name)}:text::text )').join(', ')} )\n'
          'AS UPDATED("id", "name")\n'
          'WHERE "footholds"."id" = UPDATED."id"',
        ),
        parameters: values.values,
      );
    }
  }
}

class FootholdInsertRequest {
  FootholdInsertRequest({required this.name});

  final String name;
}

class FootholdUpdateRequest {
  FootholdUpdateRequest({required this.id, this.name});

  final int id;
  final String? name;
}

class FootholdViewQueryable extends KeyedViewQueryable<FootholdView, int> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(int key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "footholds".*'
      'FROM "footholds"';

  @override
  String get tableAlias => 'footholds';

  @override
  FootholdView decode(TypedMap map) =>
      FootholdView(id: map.get('id'), name: map.get('name'));
}

class FootholdView {
  FootholdView({required this.id, required this.name});

  final int id;
  final String name;
}
