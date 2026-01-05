import 'package:compass_api/compass_api.dart';
import 'package:shared/shared.dart';

/// {@template wanderers_compass_repository}
/// Repository for Wanderers' Compass app data
/// {@endtemplate}
class CompassRepository {
  /// {@macro wandering_compass_repository}
  const CompassRepository({required this.api});

  /// API client for Schedule information
  final CompassApi api;

  /// Creates a schedule via [api]
  Future<Schedule> createSchedule({
    required String name,
    required int workingHours,
    required List<String> zones,
    required List<String> footholds,
  }) async {
    final schedule = await api.createSchedule(
      name: name,
      workingHours: workingHours,
      zones: zones,
      footholds: footholds,
    );

    return schedule;
  }

  /// Get the full schedule for a user
  Future<Schedule> getSchedule() async {
    return api.getSchedule();
  }

  /// Get the working hours for a user
  Future<int> getWorkingHours() async {
    final schedule = await api.getSchedule();
    return schedule.workingHours!;
  }
}
