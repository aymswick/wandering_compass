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
  Future<Schedule> createSchedule(
    Schedule schedule,
  ) async {
    try {
      final result = await api.createSchedule(schedule);

      return result;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  /// Get the full schedule for a user
  Future<Schedule> getSchedule() async {
    return api.getSchedule();
  }

  /// Get the working hours for a user
  Future<int> getWorkingHours() async {
    final schedule = await api.getSchedule();
    return schedule.dayEnd.difference(schedule.dayStart).inHours;
  }
}
