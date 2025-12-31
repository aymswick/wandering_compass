import 'package:schedule_api/schedule_api.dart';

/// {@template schedule_repository}
/// Repository for Schedule data
/// {@endtemplate}
class ScheduleRepository {
  /// {@macro schedule_repository}
  const ScheduleRepository({required this.api});

  /// API client for Schedule information
  final ScheduleApi api;

  /// Get the working hours for a user
  Future<int> getWorkingHours() async {
    return api.getWorkingHours();
  }
}
