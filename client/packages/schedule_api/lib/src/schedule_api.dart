/// {@template schedule_api}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
abstract interface class ScheduleApi {
  /// {@macro schedule_api}
  const ScheduleApi();

  // Returns a number of hours less than 24
  Future<int> getWorkingHours();
}
