import 'dart:convert';

import 'package:compass_api/compass_api.dart';
import 'package:http/http.dart' as http;
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Retrieves Compass data from the Dart Frog backend for the app.
class DartFrogCompassApi implements CompassApi {
  ///
  DartFrogCompassApi() : _sharedPrefs = SharedPreferencesAsync();

  final SharedPreferencesAsync _sharedPrefs;

  /// Creates a Schedule on the backend, returns [Schedule] with
  /// server-created [id]
  @override
  Future<Schedule> createSchedule({
    required String name,
    required int workingHours,
    required List<String> zones,
    required List<String> footholds,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(
          'http://localhost:8080/schedules',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'name': name,
            'workingHours': workingHours,
            'footholds': footholds,
            'zones': zones,
          },
        ),
      );

      if (response.statusCode == 201) {
        final parsedBody = jsonDecode(response.body) as Map<String, dynamic>;
        return Schedule.fromMap(parsedBody);
      } else {
        throw Exception('Server failed to create the Schedule');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Schedule> getSchedule() async {
    final data =
        await http.get(Uri.parse('localhost:8080/schedules'))
            as Map<String, dynamic>;

    // probably want getSchedule(id) or getScheduleForUser

    throw UnimplementedError();

    // return Schedule(
    //   workingHours: config['schedule']['working_hours'] as int,
    //   zones: config['schedule']['zones'] as List<String>,
    //   footholds: config['schedule']['footholds'] as List<String>,
    // );
  }
}
