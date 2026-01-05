part of 'onboarding_bloc.dart';

/// Tracks whether or not a user has gone through
/// onboarding to create the necessary data elements
class OnboardingState {
  const OnboardingState({this.status = OnboardingStatus.intial, this.schedule});

  final OnboardingStatus status;
  final Schedule? schedule;

  OnboardingState copyWith({OnboardingStatus? status, Schedule? schedule}) =>
      OnboardingState(
        status: status ?? this.status,
        schedule: schedule ?? this.schedule,
      );
}

enum OnboardingStatus { intial, loading, complete }
