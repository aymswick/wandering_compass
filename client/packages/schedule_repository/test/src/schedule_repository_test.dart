// Not required for test files
import 'package:schedule_api/schedule_api.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:test/test.dart';

import 'helper.dart';

void main() {
  group('ScheduleRepository', () {
    late final LocalFileScheduleApi mockScheduleApi;
    setUp(() {
      mockScheduleApi = MockLocalFileScheduleApi();
    });
    test('can be instantiated', () {
      expect(
        CompassRepository.WanderersCompassRepository(
          api: mockScheduleApi,
        ),
        isNotNull,
      );
    });
  });
}
