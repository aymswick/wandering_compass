// Ignore for testing purposes
// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:wandering_compass_client/app/app.dart';
import 'package:wandering_compass_client/today/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders TodayPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(TodayPage), findsOneWidget);
    });
  });
}
