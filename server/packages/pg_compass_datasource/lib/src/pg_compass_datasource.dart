import 'dart:io';

import 'package:compass_datasource/compass_datasource.dart';
import 'package:pg_compass_datasource/src/models/schedule.dart' as sb;
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

/// {@template postgres_schedule_data_source}
/// Postgres implementation of schedule data source
/// {@endtemplate}
class PgCompassDatasource implements CompassDatasource {
  /// {@macro postgres_schedule_data_source}
  PgCompassDatasource() {
    // Make sure to set these variables in your environment (i.e. build server)!
    final dbHost = Platform.environment['COMPASS_DB_HOST'];
    final dbName = Platform.environment['COMPASS_DB_NAME'];
    final dbPassword = Platform.environment['COMPASS_DB_PASSWORD'];
    final dbUser = Platform.environment['COMPASS_DB_USER'];

    _db = Database(
      host: dbHost,
      port: 5432,
      database: dbName,
      username: dbUser,
      password: dbPassword,
      useSSL: false,
    );

    // Listen for shutdown and close the pool
    ProcessSignal.sigint.watch().listen((_) async {
      await _db.close();
      exit(0);
    });
  }

  late final Database _db;

  @override
  Future<Schedule> create(Map<String, dynamic> map) async {
    try {
      logger.d('datasource create from: $map');
      final schedule = Schedule.fromMap(map);

      final insertResult = await _db.schedules.insertOne(
        sb.ScheduleInsertRequest(
          name: schedule.name,
          zones: schedule.zones,
          footholds: (map['footholds'] as List<dynamic>)
              .map(
                (e) => '$e',
              )
              .toList(),
          workingHours: map['workingHours'] as int,
        ),
      );

      return schedule.copyWith(id: insertResult);
    } catch (e) {
      logger.e(e);
      throw Exception('goddamn _db.schedules.insertOne failed');
    }
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
  Future<List<Schedule>> readAll() async {
    final readResult = await _db.schedules.querySchedules();
    final schedules = readResult
        .map(
          (e) => Schedule(
            name: e.name,
            id: e.id,
            workingHours: e.workingHours,
            footholds: e.footholds,
            // zones: e.zones,
          ),
        )
        .toList();
    return schedules;
  }

  @override
  Future<Schedule> update(String id, Schedule schedule) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
