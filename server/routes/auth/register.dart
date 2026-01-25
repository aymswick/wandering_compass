import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  final authRepository = context.read<AuthRepository>();

  if (context.request.method == HttpMethod.post) {
    try {
      final body = await context.request.json() as Map<String, dynamic>;
      final username = body['username'] as String;
      final password = body['password'] as String;
      final result = await authRepository.register(username, password);

      return Response.json(
        body: {
          'message': 'Registration successful',
          'data': result.toMap(),
        },
      );
    } catch (e) {
      logger.e(e);
      return Response.json(
        statusCode: HttpStatus.unauthorized,
        body: {'error': 'Could not register user'},
      );
    }
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
