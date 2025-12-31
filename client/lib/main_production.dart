import 'package:schedule_api/schedule_api.dart';
import 'package:wandering_compass_client/app/app.dart';
import 'package:wandering_compass_client/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    () => App(
      scheduleApiClient: LocalFileScheduleApi(),
    ),
  );
}
