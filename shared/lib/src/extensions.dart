import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';

class JsonListHook extends MappingHook {
  const JsonListHook();

  @override
  Object? beforeDecode(Object? value) {
    // If the DB sent a JSON string instead of a real Dart List
    if (value is String) {
      return jsonDecode(value);
    }
    return value;
  }
}

extension AppDateTimeSerializer on DateTime {
  String serialize() => this.toUtc().toIso8601String();
}
