// T = Return Type (User model), U = Parameter Type (String username)
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

/// {@template get_full_user_query}
///  {@endtemplate} Custom query to get user's hashed password for JWT verification only
class GetFullUserQuery extends Query<(User?, String?)?, String> {
  /// {@macro get_full_user_query}
  const GetFullUserQuery();
  @override
  Future<(User?, String?)?> apply(Session db, String username) async {
    const sql = 'SELECT * FROM users WHERE username = @username';

    final results = await db.execute(
      Sql.named(sql),
      parameters: {'username': username},
    );

    logger.d(results);

    if (results.isEmpty) return null;

    final row = results.first.toColumnMap();
    logger.d(row);

    final user = User(
      id: row['id'] as String,
      username: row['username'] as String,
    );

    final hash = row['password_hash'] as String?;

    return (
      user,
      hash,
    );
  }
}
