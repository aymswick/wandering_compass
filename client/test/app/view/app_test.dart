// Ignore for testing purposes

import 'package:flutter_test/flutter_test.dart';
import 'package:wanderers_compass/app/app.dart';
import 'package:wanderers_compass/today/counter.dart';

void main() {
  group('App', () {
    setUp(() {});
    testWidgets('renders TodayPage', (tester) async {
      await tester.pumpWidget(
        const App(),
      );
      expect(find.byType(TodayPage), findsOneWidget);
    });
  });
}
