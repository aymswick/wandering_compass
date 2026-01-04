import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:shared/shared.dart';
import 'package:stormberry/stormberry.dart';

late final Database db;

/// Any code initialized within this method will only run on server start, any hot reloads
/// afterwards will not trigger this method until a hot restart.
Future<void> init(InternetAddress ip, int port) async {
  // Make sure to set these variables in your environment (i.e. build server)!
  final dbHost = Platform.environment['COMPASS_DB_HOST'];
  final dbName = Platform.environment['COMPASS_DB_NAME'];
  final dbPassword = Platform.environment['COMPASS_DB_PASSWORD'];
  final dbUser = Platform.environment['COMPASS_DB_USER'];

  db = Database(
    host: dbHost,
    port: 5432,
    database: dbName,
    username: dbUser,
    password: dbPassword,
    useSSL: false,
  );
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // Listen for shutdown and close the pool
  ProcessSignal.sigint.watch().listen((_) async {
    await db.close();
    exit(0);
  });

  // final chain = Platform.script
  //     .resolve('certificates/server_chain.pem')
  //     .toFilePath();
  // final key = Platform.script
  //     .resolve('certificates/server_key.pem')
  //     .toFilePath();

  // final securityContext = SecurityContext()
  //   ..useCertificateChain(chain)
  //   ..usePrivateKey(key, password: 'VeryGoodPassword');

  // Warm up the pool/test connection
  try {
    logger.d(await db.schedules.querySchedules());
    logger.i('✅ Database connection pool initialized.');
  } catch (e) {
    logger.e('❌ Failed to connect to database: $e');
  }

  // TODO(ant): add securityContext here to enable https
  return serve(
    handler
        .use(provider<ScheduleRepository>((context) => db.schedules))
        .use(provider<ZoneRepository>((context) => db.zones))
        .use(provider<FootholdRepository>((context) => db.footholds)),
    ip,
    port,
  );
}
