import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';

/// Any code initialized within this method will only run on server start, any hot reloads
/// afterwards will not trigger this method until a hot restart.
Future<void> init(InternetAddress ip, int port) async {
  final conn = await Connection.open(
    Endpoint(
      host: 'localhost',
      database: 'postgres',
      username: 'user',
      password: 'pass',
    ),
  );
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  // 1. Execute any custom code prior to starting the server...

  // final chain = Platform.script
  //     .resolve('certificates/server_chain.pem')
  //     .toFilePath();
  // final key = Platform.script
  //     .resolve('certificates/server_key.pem')
  //     .toFilePath();

  // final securityContext = SecurityContext()
  //   ..useCertificateChain(chain)
  //   ..usePrivateKey(key, password: 'VeryGoodPassword');

  return serve(
    handler,
    ip,
    port,
  ); // TODO(ant): add securityContext here to enable https
}
