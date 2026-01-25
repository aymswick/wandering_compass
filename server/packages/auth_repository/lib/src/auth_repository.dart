import 'package:shared/shared.dart';

/// Authentication Repository abstract
abstract class AuthRepository {
  /// Login via JWT with [username] + [password]
  Future<Map<String, String>> login(String username, String password);

  /// Cycle the refresh token
  Future<Map<String, String>> refresh(String refreshToken);

  /// Register a new user
  Future<User> register(String username, String password);

  /// Validates JWT Token
  Future<User> validateToken(String token);
}
