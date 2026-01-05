part of 'onboarding_bloc.dart';

class CompassDataCreated extends OnboardingEvent {
  CompassDataCreated({
    required this.name,
    required this.workingHours,
    required this.zones,
    required this.footholds,
  });

  final String name;
  final int workingHours;
  final List<String> zones;
  final List<String> footholds;
}

@immutable
sealed class OnboardingEvent {}
