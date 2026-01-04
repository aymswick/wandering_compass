import 'package:http/http.dart' as http;
import 'package:schedule_api/schedule_api.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Retrieves Compass data from the Dart Frog backend for the app.
class DartFrogWanderersCompassApi implements WanderersCompassApi {
  ///
  DartFrogWanderersCompassApi() : _sharedPrefs = SharedPreferencesAsync();

  final SharedPreferencesAsync _sharedPrefs;

  @override
  Future<Schedule> getSchedule() async {
    final data =
        await http.get(Uri.parse('localhost:8080/schedules'))
            as Map<String, dynamic>;
    // final List<ScheduleView> schedules =

    throw UnimplementedError();

    // return Schedule(
    //   workingHours: config['schedule']['working_hours'] as int,
    //   zones: config['schedule']['zones'] as List<String>,
    //   footholds: config['schedule']['footholds'] as List<String>,
    // );
  }
}
