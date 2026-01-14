import 'dart:io';

import 'package:compass_datasource/compass_datasource.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:postgres_compass_datasource/postgres_compass_datasource.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final schedules = await context.read<ScheduleRepository>().querySchedules();
  return Response.json(body: schedules);
}

Future<Response> _post(RequestContext context) async {
  try {
    logger.d('schedules post');
    final dataSource = context.read<CompassDatasource>();
    final body = await context.request.json();

    final insertedSchedule = await dataSource.create(
      body as Map<String, dynamic>,
    );

    return Response.json(
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      statusCode: HttpStatus.created,
      body: insertedSchedule.toMap(),
    );
  } catch (e) {
    logger.e('Failed post: $e');
    return Response(
      statusCode: 500,
      body: ObjectCreateException('schedule').toJson(),
    );
  }
}
