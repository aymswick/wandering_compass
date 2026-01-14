import 'package:compass_api/compass_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Retrieves Compass data from the Dart Frog backend for the app.
class DartFrogCompassApi implements CompassApi {
  ///
  DartFrogCompassApi()
    : _sharedPrefs = SharedPreferencesAsync(),
      _baseUrl = const String.fromEnvironment('COMPASS_API_BASE_URL');

  final SharedPreferencesAsync _sharedPrefs;
  final String _baseUrl;

  /// Creates a Schedule on the backend, returns [Schedule] with
  /// server-created id
  @override
  Future<Schedule> createSchedule(Schedule schedule) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://$_baseUrl/schedules',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: schedule.toJson(),
      );

      final savedSchedule = Schedule.fromJson(response.body);

      return savedSchedule;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Schedule> getSchedule() async {
    final data = await http.get(Uri.parse('http://$_baseUrl/schedules'));

    logger.d('Got schedules: $data');

    // probably want getSchedule(id) or getScheduleForUser

    return Schedule.fromJson(data.body);
  }
}
