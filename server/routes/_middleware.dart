import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  handler.use(requestLogger());

  // .use(
  //   basicAuthentication<User>(
  //     authenticator: (context, username, password) {
  //       final userRepository = context.read<UserRepository>();
  //       return userRepository.fetchFromCredentials(username, password);
  //     },
  //   ),
  // )

  return (context) async {
    // Execute code before request is handled.

    // Forward the request to the respective handler.
    final response = await handler(context);

    // Execute code after request is handled.

    // Return a response.
    return response;
  };
}
