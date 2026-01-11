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
  final List<String> zones;
}

@immutable
sealed class OnboardingEvent {}
