// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// ignore_for_file: annotate_overrides
// dart format off

part of 'user.dart';

extension UserRepositories on Session {
  UserRepository get users => UserRepository._(this);
}

abstract class UserRepository
    implements
        ModelRepository,
        ModelRepositoryInsert<UserInsertRequest>,
        ModelRepositoryUpdate<UserUpdateRequest>,
        ModelRepositoryDelete<String> {
  factory UserRepository._(Session db) = _UserRepository;

  Future<UserView?> queryUser(String id);
  Future<List<UserView>> queryUsers([QueryParams? params]);
}

class _UserRepository extends BaseRepository
    with
        RepositoryInsertMixin<UserInsertRequest>,
        RepositoryUpdateMixin<UserUpdateRequest>,
        RepositoryDeleteMixin<String>
    implements UserRepository {
  _UserRepository(super.db) : super(tableName: 'users', keyName: 'id');

  @override
  Future<UserView?> queryUser(String id) {
    return queryOne(id, UserViewQueryable());
  }

  @override
  Future<List<UserView>> queryUsers([QueryParams? params]) {
    return queryMany(UserViewQueryable(), params);
  }

  @override
  Future<void> insert(List<UserInsertRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.execute(
      Sql.named(
        'INSERT INTO "users" ( "created_at", "id", "password_hash", "username" )\n'
        'VALUES ${requests.map((r) => '( ${values.add(r.createdAt)}:timestamp, ${values.add(r.id)}:text, ${values.add(r.passwordHash)}:text, ${values.add(r.username)}:text )').join(', ')}\n',
      ),
      parameters: values.values,
    );
  }

  @override
  Future<void> update(List<UserUpdateRequest> requests) async {
    if (requests.isEmpty) return;

    final updateRequests = [
      for (final r in requests)
        if (r.createdAt != null || r.passwordHash != null || r.username != null)
          r,
    ];

    if (updateRequests.isNotEmpty) {
      var values = QueryValues();
      await db.execute(
        Sql.named(
          'UPDATE "users"\n'
          'SET "created_at" = COALESCE(UPDATED."created_at", "users"."created_at"), "password_hash" = COALESCE(UPDATED."password_hash", "users"."password_hash"), "username" = COALESCE(UPDATED."username", "users"."username")\n'
          'FROM ( VALUES ${updateRequests.map((r) => '( ${values.add(r.createdAt)}:timestamp::timestamp, ${values.add(r.id)}:text::text, ${values.add(r.passwordHash)}:text::text, ${values.add(r.username)}:text::text )').join(', ')} )\n'
          'AS UPDATED("created_at", "id", "password_hash", "username")\n'
          'WHERE "users"."id" = UPDATED."id"',
        ),
        parameters: values.values,
      );
    }
  }
}

class UserInsertRequest {
  UserInsertRequest({
    this.createdAt,
    required this.id,
    this.passwordHash,
    required this.username,
  });

  final DateTime? createdAt;
  final String id;
  final String? passwordHash;
  final String username;
}

class UserUpdateRequest {
  UserUpdateRequest({
    this.createdAt,
    required this.id,
    this.passwordHash,
    this.username,
  });

  final DateTime? createdAt;
  final String id;
  final String? passwordHash;
  final String? username;
}

class UserViewQueryable extends KeyedViewQueryable<UserView, String> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(String key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "users".*, "refreshTokens"."data" as "refreshTokens"'
      'FROM "users"'
      'LEFT JOIN ('
      '  SELECT "refresh_tokens"."user_id",'
      '    to_jsonb(array_agg("refresh_tokens".*)) as data'
      '  FROM (${RefreshTokenViewQueryable().query}) "refresh_tokens"'
      '  GROUP BY "refresh_tokens"."user_id"'
      ') "refreshTokens"'
      'ON "users"."id" = "refreshTokens"."user_id"';

  @override
  String get tableAlias => 'users';

  @override
  UserView decode(TypedMap map) => UserView(
    createdAt: map.getOpt('created_at'),
    id: map.get('id'),
    refreshTokens:
        map.getListOpt('refreshTokens', RefreshTokenViewQueryable().decoder) ??
        const [],
    username: map.get('username'),
  );
}

class UserView {
  UserView({
    this.createdAt,
    required this.id,
    required this.refreshTokens,
    required this.username,
  });

  final DateTime? createdAt;
  final String id;
  final List<RefreshTokenView> refreshTokens;
  final String username;
}
