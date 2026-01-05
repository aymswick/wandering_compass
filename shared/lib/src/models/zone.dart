import 'package:dart_mappable/dart_mappable.dart';

part 'zone.mapper.dart';

@MappableClass()
class Zone with ZoneMappable {
  final String? id;
  final String name;
  const Zone({this.id, required this.name});
}
