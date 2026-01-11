part of 'onboarding_bloc.dart';

/// Tracks whether or not a user has gone through
/// onboarding to create the necessary data elements
class OnboardingState {
  const OnboardingState({
    this.status = OnboardingStatus.intial,
    this.schedule,
    this.message,
  });

  final OnboardingStatus status;
  final Schedule? schedule;
  final String? message;

  OnboardingState copyWith({
    OnboardingStatus? status,
    Schedule? schedule,
    String? message,
  }) => OnboardingState(
    status: status ?? this.status,
    schedule: schedule ?? this.schedule,
    message: message ?? this.message,
  );
}

enum OnboardingStatus { intial, loading, error, complete }
