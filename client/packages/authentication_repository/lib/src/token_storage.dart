// auth_repository.dart (Pure Dart)

abstract class TokenStorage {
  Future<void> clear();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> saveToken({required TokenType type, required String token});
}

enum TokenType {
  access,
  refresh,
}
