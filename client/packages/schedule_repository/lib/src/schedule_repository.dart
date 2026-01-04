import 'package:schedule_api/schedule_api.dart';
import 'package:shared/shared.dart';

/// {@template wanderers_compass_repository}
/// Repository for Wanderers' Compass app data
/// {@endtemplate}
class CompassRepository {
  /// {@macro wandering_compass_repository}
  const CompassRepository({required this.api});

  /// API client for Schedule information
  final WanderersCompassApi api;

  /// Get the full schedule for a user
  Future<Schedule> getSchedule() async {
    return api.getSchedule();
  }

  /// Get the working hours for a user
  Future<int> getWorkingHours() async {
    final schedule = await api.getSchedule();
    return schedule.workingHours;
  }
}
