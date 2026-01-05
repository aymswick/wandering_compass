import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:compass_repository/compass_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared/shared.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required this.repository}) : super(const OnboardingState()) {
    on<CompassDataCreated>((event, emit) async {
      try {
        emit(state.copyWith(status: OnboardingStatus.loading));
        await Future.delayed(
          const Duration(seconds: 1),
        ); // TODO(ant): remove this

        final result = await repository.createSchedule(
          name: event.name,
          workingHours: event.workingHours,
          zones: event.zones,
          footholds: event.footholds,
        );

        emit(
          state.copyWith(schedule: result, status: OnboardingStatus.complete),
        );
      } catch (e) {
        logger.e(e);
        emit(state.copyWith(status: OnboardingStatus.error));
      }
    });
  }

  final CompassRepository repository;
}
