part of 'onboarding_bloc.dart';

/// Tracks whether or not a user has gone through
/// onboarding to create the necessary data elements
@MappableClass()
class OnboardingState with OnboardingStateMappable {
  const OnboardingState({
    this.status = OnboardingStatus.intial,
    this.schedule,
    this.zones = const [
      Zone(name: 'Open'),
      Zone(name: 'Work'),
      Zone(name: 'Close'),
    ],
    this.message,
  });

  final OnboardingStatus status;
  final Schedule? schedule;
  final List<Zone> zones;
  final String? message;
}

enum OnboardingStatus { intial, loading, error, complete }
