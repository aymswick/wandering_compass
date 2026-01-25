import 'dart:io';

import 'package:auth_repository/auth_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';

Future<Response> onRequest(RequestContext context) async {
  final authRepository = context.read<AuthRepository>();
  logger.d(context.request.method);

  if (context.request.method == HttpMethod.post) {
    try {
      logger.d('Trying login');
      final body = await context.request.json() as Map<String, dynamic>;
      final username = body['username'] as String;
      final password = body['password'] as String;
      logger.d(username);
      final result = await authRepository.login(username, password);

      return Response.json(
        body: {
          'message': 'Login successful',
          'data': result,
        },
      );
    } catch (e) {
      logger.e(e);
      return Response.json(
        statusCode: HttpStatus.unauthorized,
        body: {'error': 'Invalid username or password'},
      );
    }
  } else {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
