import 'package:dart_mappable/dart_mappable.dart';

part 'zone.mapper.dart';

@MappableClass()
class Zone with ZoneMappable {
  final String? id;
  final String name;
  final DateTime? start;
  final DateTime? end;

  const Zone({this.id, required this.name, this.start, this.end});
}
