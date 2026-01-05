import 'package:shared/shared.dart';

/// Datasource contract for Schedule
abstract class CompassDatasource {
  /// Create and return the newly created schedule.
  Future<Schedule> create(Map<String, dynamic> map);

  /// Delete the schedule with the provided [id] if one exists.
  Future<void> delete(String id);

  /// Return a schedule with the provided [id] if one exists.
  Future<Schedule?> read(String id);

  /// Return all schedules.
  Future<List<Schedule>> readAll();

  /// Update the schedule with the provided [id] to match [schedule] and
  /// return the updated schedule.
  Future<Schedule> update(String id, Schedule schedule);
}
