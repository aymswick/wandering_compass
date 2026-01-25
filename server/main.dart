import 'dart:io';

import 'package:auth_postgres_repository/auth_postgres_repository.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:compass_datasource/compass_datasource.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:postgres_compass_datasource/postgres_compass_datasource.dart';
import 'package:shared/shared.dart';

late final AuthRepository authRepository;
late final CompassDatasource compassDatasource;

/// Any code initialized within this method will only run on server start, any
/// hot reloads afterwards will not trigger this method until a hot restart.
Future<void> init(InternetAddress ip, int port) async {
  // Set up datasources
  compassDatasource = PgCompassDatasource();
  authRepository = AuthPostgresRepository(compassDatasource);
}

Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
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
    logger
      ..d(await compassDatasource.readAll())
      ..i('✅ Database connection pool initialized.');
  } catch (e) {
    logger.e('❌ Failed to connect to database: $e');
  }

  // TODO(ant): add securityContext here to enable https
  return serve(
    handler
        .use(provider<CompassDatasource>((context) => compassDatasource))
        .use(
          provider<AuthRepository>(
            (context) => authRepository,
          ),
        ),
    ip,
    port,
  );
}
