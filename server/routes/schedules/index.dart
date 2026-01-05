import 'dart:io';

import 'package:compass_datasource/compass_datasource.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:pg_compass_datasource/pg_compass_datasource.dart';
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
  logger.d('schedules post');
  final dataSource = context.read<CompassDatasource>();
  final body = await context.request.json() as Map<String, dynamic>;
  logger.d(body);
  // final todo = Todo.fromJson(
  //   await context.request.json() as Map<String, dynamic>,
  // );

  return Response.json(
    statusCode: HttpStatus.created,
    body: await dataSource.create(body),
  );
}
