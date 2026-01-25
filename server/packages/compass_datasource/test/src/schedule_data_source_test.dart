// Not required for test files

import 'package:compass_datasource/compass_datasource.dart';
import 'package:shared/shared.dart';
import 'package:test/test.dart';

void main() {
  group('ScheduleDataSource', () {
    test('can be implemented', () {
      expect(_TestScheduleDatasource(), isNotNull);
    });
  });
}

class _TestScheduleDatasource implements CompassDatasource {
  @override
  Future<Schedule> create(Map<String, dynamic> map) =>
      throw UnimplementedError();

  @override
  Future<User?> createUser({
    required String username,
    required String passwordHash,
  }) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) => throw UnimplementedError();

  @override
  Future<User?> fetchUserById(String id) {
    // TODO: implement fetchUserById
    throw UnimplementedError();
  }

  @override
  Future<User?> fetchUserByUsername(String id) {
    // TODO: implement fetchUserByUsername
    throw UnimplementedError();
  }

  @override
  Future<(User?, String?)?> getUserWithHash(String username) {
    // TODO: implement getUserWithHash
    throw UnimplementedError();
  }

  @override
  Future<Schedule?> read(int id) => throw UnimplementedError();

  @override
  Future<List<Schedule>> readAll() => throw UnimplementedError();

  @override
  Future<Schedule> update(int id, Schedule schedule) =>
      throw UnimplementedError();

  @override
  Future<void> updateRefreshToken({
    required String userId,
    required String token,
  }) {
    // TODO: implement updateRefreshToken
    throw UnimplementedError();
  }
}
