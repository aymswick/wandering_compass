import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureTokenStorage implements TokenStorage {
  static const _accessKey = 'access_token';
  static const _refreshKey = 'refresh_token';

  final _storage = const FlutterSecureStorage();

  @override
  Future<void> clear() => _storage.delete(key: _accessKey);

  @override
  Future<String?> getAccessToken() => _storage.read(key: _accessKey);
  @override
  Future<String?> getRefreshToken() => _storage.read(key: _refreshKey);

  @override
  Future<void> saveToken({required TokenType type, required String token}) =>
      _storage.write(
        key: switch (type) {
          (TokenType.access) => _accessKey,
          (TokenType.refresh) => _refreshKey,
        },
        value: token,
      );
}
