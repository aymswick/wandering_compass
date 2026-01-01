import 'package:shared/shared.dart';

/// {@template schedule_api}
/// Abstract interface to allow multiple Schedule providers
/// {@endtemplate}
abstract interface class ScheduleApi {
  /// {@macro schedule_api}
  const ScheduleApi();

  // Returns a Schedule
  Future<Schedule> getSchedule();
}
