// Not required for test files
import 'package:postgres_compass_datasource/postgres_compass_datasource.dart';
import 'package:test/test.dart';

void main() {
  group('PostgresScheduleDataSource', () {
    test('can be instantiated', () {
      expect(PgCompassDatasource(), isNotNull);
    });
  });
}
