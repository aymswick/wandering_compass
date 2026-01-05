// Not required for test files
import 'package:compass_api/compass_api.dart';
import 'package:compass_repository/compass_repository.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group('CompassRepository', () {
    late final CompassApi mockCompassApi;
    setUp(() {
      mockCompassApi = MockCompassApi();
    });
    test('can be instantiated', () {
      expect(
        CompassRepository(
          api: mockCompassApi,
        ),
        isNotNull,
      );
    });
  });
}
