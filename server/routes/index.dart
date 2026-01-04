import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  // TODO(ant): test connection to postgres
  return Response(body: 'Welcome to Dart Frog!');
}
