import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:schedule_api/schedule_api.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toml/toml.dart';

/// Retrieves Schedule data from a local file on the user's device
class LocalFileScheduleApi implements ScheduleApi {
  /// Initializes a schedule from config file
  LocalFileScheduleApi() : _sharedPrefs = SharedPreferencesAsync();

  final SharedPreferencesAsync _sharedPrefs;

  @override
  Future<Schedule> getSchedule() async {
    final config = await loadConfig();
    return Schedule(
      workingHours: config['schedule']['working_hours'] as int,
      zones: config['schedule']['zones'] as List<String>,
      footholds: config['schedule']['footholds'] as List<String>,
    );
  }

  /// Reads a simple schedule config in TOML format
  Future<Map<String, dynamic>> loadConfig() async {
    try {
      final result = await FilePicker.platform.pickFiles();

      final file = File(result!.files.single.path!);
      final content = await file.readAsString();
      final config = TomlDocument.parse(content).toMap();

      return config;
    } catch (e) {
      logger.e('Error getting schedule config file');
      rethrow;
    }
  }
}
