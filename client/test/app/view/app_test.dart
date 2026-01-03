// Ignore for testing purposes

import 'package:flutter_test/flutter_test.dart';
import 'package:schedule_api/schedule_api.dart';
import 'package:wandering_compass_client/app/app.dart';
import 'package:wandering_compass_client/today/counter.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    late final ScheduleApi mockScheduleApi;
    setUp(() {
      mockScheduleApi = MockScheduleApi();
    });
    testWidgets('renders TodayPage', (tester) async {
      await tester.pumpWidget(
        App(
          scheduleApiClient: mockScheduleApi,
        ),
      );
      expect(find.byType(TodayPage), findsOneWidget);
    });
  });
}
