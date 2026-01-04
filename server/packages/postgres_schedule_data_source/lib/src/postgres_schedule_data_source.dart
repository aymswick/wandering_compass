import 'package:schedule_data_source/schedule_data_source.dart';
import 'package:shared/src/schedule.dart';

/// {@template postgres_schedule_data_source}
/// Postgres implementation of schedule data source
/// {@endtemplate}
class PostgresScheduleDataSource implements ScheduleDatasource {
  /// {@macro postgres_schedule_data_source}
  const PostgresScheduleDataSource();

  @override
  Future<Schedule> create(Schedule schedule) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Schedule?> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<List<Schedule>> readAll() {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<Schedule> update(String id, Schedule schedule) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
