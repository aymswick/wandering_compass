import 'package:stormberry/stormberry.dart';

part 'refresh_token.schema.dart';

@Model(
  indexes: [
    TableIndex(name: 'refresh_token_unique', columns: ['token'], unique: true),
  ],
)
abstract class RefreshToken {
  DateTime get expiresAt;

  @PrimaryKey()
  String get id;

  String get token;
}
