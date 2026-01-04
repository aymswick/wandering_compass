import 'package:shared/shared.dart';

/// {@template schedule_api}
/// Abstract interface to allow multiple Compass providers
/// {@endtemplate}
abstract interface class WanderersCompassApi {
  /// {@macro schedule_api}
  const WanderersCompassApi();

  // Returns a Schedule
  Future<Schedule> getSchedule();
}
