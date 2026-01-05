// Not required for test files
import 'package:pg_compass_datasource/pg_compass_datasource.dart';
import 'package:test/test.dart';

void main() {
  group('PostgresScheduleDataSource', () {
    test('can be instantiated', () {
      expect(const PgCompassDatasource(), isNotNull);
    });
  });
}
