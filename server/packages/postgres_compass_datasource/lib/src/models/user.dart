import 'package:postgres_compass_datasource/src/models/refresh_token.dart';
import 'package:stormberry/stormberry.dart';

part 'user.schema.dart';

@Model(
  indexes: [
    TableIndex(name: 'username_unique', columns: ['username'], unique: true),
  ],
)
abstract class User {
  DateTime? get createdAt;

  @PrimaryKey()
  String get id;

  @HiddenIn.defaultView()
  String? get passwordHash;

  List<RefreshToken> get refreshTokens;

  String get username;
}
