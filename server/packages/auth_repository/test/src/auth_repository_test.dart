// Not required for test files
import 'package:auth_repository/auth_repository.dart';
import 'package:shared/src/models/user.dart';
import 'package:test/test.dart';

void main() {
  group('UserRepository', () {
    test('can be implemented', () {
      expect(AuthRepositoryTest(), isNotNull);
    });
  });
}

class AuthRepositoryTest implements AuthRepository {
  @override
  Future<Map<String, String>> login(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> refresh(String refreshToken) {
    throw UnimplementedError();
  }

  @override
  Future<User> validateToken(String token) {
    // TODO: implement validateToken
    throw UnimplementedError();
  }
}
