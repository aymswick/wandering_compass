import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:postgres/postgres.dart';
import 'package:shared/shared.dart';

late final Pool pool;

/// Any code initialized within this method will only run on server start, any hot reloads
/// afterwards will not trigger this method until a hot restart.
Future<void> init(InternetAddress ip, int port) async {
  // Make sure to set these variables in your environment (i.e. build server)!
  final dbHost = Platform.environment['COMPASS_DB_HOST'];
  final dbName = Platform.environment['COMPASS_DB_NAME'];
  final dbPassword = Platform.environment['COMPASS_DB_PASSWORD'];
  final dbUser = Platform.environment['COMPASS_DB_USER'];

  pool = Pool.withEndpoints(
    [
      Endpoint(
        host: dbHost!,
        database: dbName!,
        username: dbUser,
        password: dbPassword,
      ),
    ],
    settings: const PoolSettings(
      maxConnectionCount: 5,
      sslMode: SslMode.disable, // TODO(ant): Enable this for production!
    ),
  );
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
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

  // 2. Optional: Warm up the pool/test connection
  try {
    await pool.execute('SELECT 1');
    logger.i('✅ Database connection pool initialized.');
  } catch (e) {
    logger.e('❌ Failed to connect to database: $e');
    exit(1);
  }
  // TODO(ant): add securityContext here to enable https
  return serve(
    handler,
    ip,
    port,
  );
}
