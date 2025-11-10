// Not required for test files
// ignore_for_file: prefer_const_constructors
import 'package:test/test.dart';
import 'package:schedules_datasource/schedules_datasource.dart';

void main() {
  group('SchedulesDatasource', () {
    test('can be instantiated', () {
      expect(SchedulesDatasource(), isNotNull);
    });
  });
}
