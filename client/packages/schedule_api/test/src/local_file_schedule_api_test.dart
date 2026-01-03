// Not required for test files
import 'package:schedule_api/schedule_api.dart';
import 'package:test/test.dart';

void main() {
  group('ScheduleApi', () {
    test('can be instantiated', () {
      expect(LocalFileScheduleApi(), isNotNull);
    });
  });
}
