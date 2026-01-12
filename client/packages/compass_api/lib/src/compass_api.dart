import 'package:shared/shared.dart';

/// {@template schedule_api}
/// Abstract interface to allow multiple Compass providers
/// {@endtemplate}
abstract interface class CompassApi {
  /// {@macro schedule_api}
  const CompassApi();

  /// Create a Schedule
  Future<Schedule> createSchedule(Schedule schedule);

  /// Returns a Schedule
  Future<Schedule> getSchedule();
}
