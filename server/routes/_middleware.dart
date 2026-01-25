import 'package:auth_repository/auth_repository.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_auth/dart_frog_auth.dart';
import 'package:shared/shared.dart';

Handler middleware(Handler handler) {
  handler
    ..use(requestLogger())
    ..use(
      bearerAuthentication<User>(
        authenticator: (context, token) async {
          logger.d('hello from auth middleware');
          final authRepository = context.read<AuthRepository>();
          return authRepository.validateToken(token);
        },
        applies: (context) async {
          final path = context.request.url.path;
          // Exclude auth-related routes like login and register
          return !path.startsWith('auth/login') &&
              !path.startsWith('auth/register');
        },
      ),
    );

  return (context) async {
    // Execute code before request is handled.

    // Forward the request to the respective handler.
    final response = await handler(context);

    // Execute code after request is handled.

    // Return a response.
    return response;
  };
}
