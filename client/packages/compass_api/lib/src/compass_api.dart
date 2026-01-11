import 'package:shared/shared.dart';

/// {@template schedule_api}
/// Abstract interface to allow multiple Compass providers
/// {@endtemplate}
abstract interface class CompassApi {
  /// {@macro schedule_api}
  const CompassApi();

  /// Create a Schedule
  Future<Schedule> createSchedule({
    required String name,
    required DateTime dayStart,
    required DateTime dayEnd,
    required List<String> zones,
    required List<String> footholds,
  });

  /// Returns a Schedule
  Future<Schedule> getSchedule();
}
