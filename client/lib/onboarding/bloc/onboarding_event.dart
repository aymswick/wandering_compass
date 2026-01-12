part of 'onboarding_bloc.dart';

class CompassDataCreated extends OnboardingEvent {
  CompassDataCreated({
    required this.name,
    required this.dayStart,
    required this.dayEnd,
    required this.zones,
  });

  final String name;
  final DateTime dayStart;
  final DateTime dayEnd;
  final List<Zone> zones;
}

@immutable
sealed class OnboardingEvent {}

class ZoneAdded extends OnboardingEvent {
  ZoneAdded(this.zone);
  final Zone zone;
}

class ZonesModified extends OnboardingEvent {
  ZonesModified(this.zones);
  final List<Zone> zones;
}

class ZonesReordered extends OnboardingEvent {
  ZonesReordered(this.oldIndex, this.newIndex);
  final int oldIndex;
  final int newIndex;
}
