import 'package:authentication_repository/authentication_repository.dart';
import 'package:http/http.dart' as http;
import 'package:wanderers_compass/app/app.dart';
import 'package:wanderers_compass/bootstrap.dart';
import 'package:wanderers_compass/shared/secure_token_storage.dart';

Future<void> main() async {
  await bootstrap(
    () => App(
      authenticationRepository: AuthenticationRepository(
        httpClient: http.Client(),
        tokenStorage: SecureTokenStorage(),
      ),
    ),
  );
}
