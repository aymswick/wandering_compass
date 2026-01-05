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
  Future<Schedule> create(Schedule schedule) => throw UnimplementedError();

  @override
  Future<void> delete(String id) => throw UnimplementedError();

  @override
  Future<Schedule?> read(String id) => throw UnimplementedError();

  @override
  Future<List<Schedule>> readAll() => throw UnimplementedError();

  @override
  Future<Schedule> update(String id, Schedule schedule) =>
      throw UnimplementedError();
}
