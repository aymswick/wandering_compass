import 'package:schedule_api/schedule_api.dart';
import 'package:shared/shared.dart';

/// {@template schedule_repository}
/// Repository for Schedule data
/// {@endtemplate}
class ScheduleRepository {
  /// {@macro schedule_repository}
  const ScheduleRepository({required this.api});

  /// API client for Schedule information
  final ScheduleApi api;

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
