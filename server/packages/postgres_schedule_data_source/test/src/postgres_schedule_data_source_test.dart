// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:postgres_schedule_data_source/postgres_schedule_data_source.dart';

void main() {
  group('PostgresScheduleDataSource', () {
    test('can be instantiated', () {
      expect(PostgresScheduleDataSource(), isNotNull);
    });
  });
}
