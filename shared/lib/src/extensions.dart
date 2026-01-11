extension AppDateTimeSerializer on DateTime {
  String serialize() => this.toUtc().toIso8601String();
}
