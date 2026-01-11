import 'package:wanderers_compass/app/app.dart';
import 'package:wanderers_compass/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    () => const App(),
  );
}
