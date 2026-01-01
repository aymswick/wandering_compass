import 'package:dart_mappable/dart_mappable.dart';

part 'schedule.mapper.dart';

@MappableClass()
class Schedule with ScheduleMappable {
  final int workingHours;

  const Schedule({required this.workingHours});
}


// Open
// Bootup
// Launch
// Work
// Log
// Off
// Touchdown
// Close