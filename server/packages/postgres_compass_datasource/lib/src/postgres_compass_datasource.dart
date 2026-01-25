import 'dart:io';

import 'package:compass_datasource/compass_datasource.dart';
import 'package:postgres_compass_datasource/src/custom_queries.dart';
import 'package:postgres_compass_datasource/src/models/refresh_token.dart';
import 'package:postgres_compass_datasource/src/models/schedule.dart' as sb;
import 'package:postgres_compass_datasource/src/models/user.dart' as model;
import 'package:postgres_compass_datasource/src/models/zone.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';
import 'package:uuid/uuid.dart';

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

      final scheduleInsertResult = await _db.schedules.insertOne(
        sb.ScheduleInsertRequest(
          name: schedule.name,
          footholds: (map['footholds'] as List<dynamic>)
              .map(
                (e) => '$e',
              )
              .toList(),
          dayStart: DateTime.parse(
            map['dayStart'] as String,
          ),
          dayEnd: DateTime.parse(
            map['dayEnd'] as String,
          ),
        ),
      );

      logger.i('Inserted schedule: $scheduleInsertResult');

      final zonesInsertResult = await _db.zones.insertMany(
        schedule.zones
            .map(
              (z) => ZoneInsertRequest(
                footholds: [],
                name: z.name,
                start: z.start ?? DateTime.now(),
                stop: z.end ?? DateTime.now(),
                scheduleId: scheduleInsertResult,
              ),
            )
            .toList(),
      );

      logger.i('Inserted zones: $zonesInsertResult');

      return schedule.copyWith(id: scheduleInsertResult);
    } catch (e) {
      logger.e(e);
      throw Exception('goddamn datasource inserty failed');
    }
  }

  @override
  Future<User?> createUser({
    required String username,
    required String passwordHash,
  }) async {
    try {
      final uuid = const Uuid().v4();
      await _db.users.insertOne(
        model.UserInsertRequest(
          id: uuid,
          username: username,
          passwordHash: passwordHash,
          createdAt: DateTime.now(),
        ),
      );

      return User(
        id: uuid,
        username: username,
      );
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<User?> fetchUserById(String id) async {
    try {
      final result = await _db.users.queryUser(id);

      return User(username: result!.username, id: result.id);
    } catch (e) {
      logger.e(e);
    }
    return null;
  }

  @override
  Future<User?> fetchUserByUsername(String username) async {
    final result = (await _db.users.queryUsers(
      QueryParams(
        where: 'username = @username',
        values: {'username': username},
        limit: 1,
      ),
    )).firstOrNull;

    if (result == null) {
      logger.i('No user found for username: $username');
      return null;
    }

    return User(username: result.username, id: result.id);
  }

  @override
  Future<(User?, String?)?> getUserWithHash(String username) async {
    try {
      final result = await _db.users.query(const GetFullUserQuery(), username);

      return result;
    } catch (err) {
      logger.e(err);
      rethrow;
    }
  }

  @override
  Future<Schedule?> read(int id) async {
    final result = await _db.schedules.querySchedule(id);
    return Schedule(
      name: result!.name,
      dayStart: result.dayStart,
      dayEnd: result.dayEnd,
    );
  }

  @override
  Future<List<Schedule>> readAll() async {
    final readResult = await _db.schedules.querySchedules();
    final schedules = readResult
        .map(
          (e) => Schedule(
            name: e.name,
            id: e.id,
            dayStart: e.dayStart,
            dayEnd: e.dayEnd,
            footholds: e.footholds,
          ),
        )
        .toList();
    return schedules;
  }

  @override
  Future<Schedule> update(int id, Schedule schedule) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> updateRefreshToken({
    required String userId,
    required String token,
  }) async {
    try {
      await _db.refreshTokens.insertOne(
        RefreshTokenInsertRequest(
          id: const Uuid().v4(),
          userId: userId,
          token: token,
          expiresAt: DateTime.now().add(const Duration(days: 7)),
        ),
      );
    } catch (e) {
      logger.e(e);
    }
  }
}
