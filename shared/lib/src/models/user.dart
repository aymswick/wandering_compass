import 'package:dart_mappable/dart_mappable.dart';

part 'user.mapper.dart';

@MappableClass()
class User with UserMappable {
  final String? id;
  final String username;
  final String? refreshToken;
  const User({this.id, required this.username, this.refreshToken});
}
