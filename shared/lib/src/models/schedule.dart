import "package:dart_mappable/dart_mappable.dart";

part 'schedule.mapper.dart';

@MappableClass()
class Schedule with ScheduleMappable {
  static final fromJson = ScheduleMapper.fromJson;
  static final fromMap = ScheduleMapper.fromMap;

  final int? id;

  final String name;

  final int? workingHours;

  final List<String> zones;

  final List<String>
  footholds; // TODO(ant): use Foothold class instead of String

  const Schedule({
    this.id,
    required this.name,
    this.workingHours,
    this.footholds = const [],
    this.zones = const [],
  });
}
