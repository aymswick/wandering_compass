import 'package:wandering_compass_client/app/app.dart';
import 'package:wandering_compass_client/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
