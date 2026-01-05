// Not required for test files
import 'package:compass_api/compass_api.dart';
import 'package:shared/src/models/schedule.dart';
import 'package:test/test.dart';

void main() {
  group('CompassApi', () {
    test('can be implemented', () {
      expect(_TestCompassApi(), isNotNull);
    });
  });
}

class _TestCompassApi implements CompassApi {
  @override
  Future<Schedule> getSchedule() {
    throw UnimplementedError();
  }
}
