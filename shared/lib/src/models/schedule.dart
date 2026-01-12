import "package:dart_mappable/dart_mappable.dart";
import "package:shared/shared.dart";

part 'schedule.mapper.dart';

@MappableClass()
class Schedule with ScheduleMappable {
  static final fromJson = ScheduleMapper.fromJson;
  static final fromMap = ScheduleMapper.fromMap;

  final int? id;

  final String name;

  final DateTime dayStart;

  final DateTime dayEnd;

  final List<Zone> zones;

  final List<String>
  footholds; // TODO(ant): use Foothold class instead of String

  const Schedule({
    this.id,
    required this.name,
    required this.dayStart,
    required this.dayEnd,
    this.footholds = const [],
    this.zones = const [],
  });
}
