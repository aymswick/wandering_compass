// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// ignore_for_file: annotate_overrides
// dart format off

part of 'refresh_token.dart';

extension RefreshTokenRepositories on Session {
  RefreshTokenRepository get refreshTokens => RefreshTokenRepository._(this);
}

abstract class RefreshTokenRepository
    implements
        ModelRepository,
        ModelRepositoryInsert<RefreshTokenInsertRequest>,
        ModelRepositoryUpdate<RefreshTokenUpdateRequest>,
        ModelRepositoryDelete<String> {
  factory RefreshTokenRepository._(Session db) = _RefreshTokenRepository;

  Future<RefreshTokenView?> queryRefreshToken(String id);
  Future<List<RefreshTokenView>> queryRefreshTokens([QueryParams? params]);
}

class _RefreshTokenRepository extends BaseRepository
    with
        RepositoryInsertMixin<RefreshTokenInsertRequest>,
        RepositoryUpdateMixin<RefreshTokenUpdateRequest>,
        RepositoryDeleteMixin<String>
    implements RefreshTokenRepository {
  _RefreshTokenRepository(super.db)
    : super(tableName: 'refresh_tokens', keyName: 'id');

  @override
  Future<RefreshTokenView?> queryRefreshToken(String id) {
    return queryOne(id, RefreshTokenViewQueryable());
  }

  @override
  Future<List<RefreshTokenView>> queryRefreshTokens([QueryParams? params]) {
    return queryMany(RefreshTokenViewQueryable(), params);
  }

  @override
  Future<void> insert(List<RefreshTokenInsertRequest> requests) async {
    if (requests.isEmpty) return;
    var values = QueryValues();
    await db.execute(
      Sql.named(
        'INSERT INTO "refresh_tokens" ( "expires_at", "id", "token", "user_id" )\n'
        'VALUES ${requests.map((r) => '( ${values.add(r.expiresAt)}:timestamp, ${values.add(r.id)}:text, ${values.add(r.token)}:text, ${values.add(r.userId)}:text )').join(', ')}\n',
      ),
      parameters: values.values,
    );
  }

  @override
  Future<void> update(List<RefreshTokenUpdateRequest> requests) async {
    if (requests.isEmpty) return;

    final updateRequests = [
      for (final r in requests)
        if (r.expiresAt != null || r.token != null || r.userId != null) r,
    ];

    if (updateRequests.isNotEmpty) {
      var values = QueryValues();
      await db.execute(
        Sql.named(
          'UPDATE "refresh_tokens"\n'
          'SET "expires_at" = COALESCE(UPDATED."expires_at", "refresh_tokens"."expires_at"), "token" = COALESCE(UPDATED."token", "refresh_tokens"."token"), "user_id" = COALESCE(UPDATED."user_id", "refresh_tokens"."user_id")\n'
          'FROM ( VALUES ${updateRequests.map((r) => '( ${values.add(r.expiresAt)}:timestamp::timestamp, ${values.add(r.id)}:text::text, ${values.add(r.token)}:text::text, ${values.add(r.userId)}:text::text )').join(', ')} )\n'
          'AS UPDATED("expires_at", "id", "token", "user_id")\n'
          'WHERE "refresh_tokens"."id" = UPDATED."id"',
        ),
        parameters: values.values,
      );
    }
  }
}

class RefreshTokenInsertRequest {
  RefreshTokenInsertRequest({
    required this.expiresAt,
    required this.id,
    required this.token,
    this.userId,
  });

  final DateTime expiresAt;
  final String id;
  final String token;
  final String? userId;
}

class RefreshTokenUpdateRequest {
  RefreshTokenUpdateRequest({
    this.expiresAt,
    required this.id,
    this.token,
    this.userId,
  });

  final DateTime? expiresAt;
  final String id;
  final String? token;
  final String? userId;
}

class RefreshTokenViewQueryable
    extends KeyedViewQueryable<RefreshTokenView, String> {
  @override
  String get keyName => 'id';

  @override
  String encodeKey(String key) => TextEncoder.i.encode(key);

  @override
  String get query =>
      'SELECT "refresh_tokens".*'
      'FROM "refresh_tokens"';

  @override
  String get tableAlias => 'refresh_tokens';

  @override
  RefreshTokenView decode(TypedMap map) => RefreshTokenView(
    expiresAt: map.get('expires_at'),
    id: map.get('id'),
    token: map.get('token'),
  );
}

class RefreshTokenView {
  RefreshTokenView({
    required this.expiresAt,
    required this.id,
    required this.token,
  });

  final DateTime expiresAt;
  final String id;
  final String token;
}
