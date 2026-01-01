import 'package:dart_mappable/dart_mappable.dart';

part 'schedule.mapper.dart';

@MappableClass()
class Schedule with ScheduleMappable {
  final int workingHours;
  final List<String> zones;
  final List<String> footholds;

  const Schedule({
    required this.workingHours,
    required this.zones,
    required this.footholds,
  });
}
