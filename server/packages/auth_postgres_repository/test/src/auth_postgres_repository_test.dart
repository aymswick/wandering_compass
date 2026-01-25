// Not required for test files
import 'package:auth_postgres_repository/auth_postgres_repository.dart';
import 'package:compass_datasource/compass_datasource.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

void main() {
  late CompassDatasource compassDatasource;
  setUp(() {
    compassDatasource = MockCompassDatasource();
  });
  group('AuthPostgresRepository', () {
    test('can be instantiated', () {
      expect(AuthPostgresRepository(compassDatasource), isNotNull);
    });
  });
}

class MockCompassDatasource extends Mock implements CompassDatasource {}
