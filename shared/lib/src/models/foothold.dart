import 'package:dart_mappable/dart_mappable.dart';

part 'foothold.mapper.dart';

@MappableClass()
class Foothold with FootholdMappable {
  final String? id;
  final String name;
  const Foothold({this.id, required this.name});
}
