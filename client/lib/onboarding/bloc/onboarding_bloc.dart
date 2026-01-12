import 'package:bloc/bloc.dart';
import 'package:compass_repository/compass_repository.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:shared/shared.dart';

part 'onboarding_bloc.mapper.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc({required this.repository}) : super(const OnboardingState()) {
    on<CompassDataCreated>((event, emit) async {
      try {
        emit(state.copyWith(status: OnboardingStatus.loading));

        final result = await repository.createSchedule(
          Schedule(
            name: event.name,
            dayStart: event.dayStart,
            dayEnd: event.dayEnd,
            zones: event.zones,
          ),
        );

        emit(
          state.copyWith(schedule: result, status: OnboardingStatus.complete),
        );
      } catch (e) {
        logger.e(e);
        emit(
          state.copyWith(status: OnboardingStatus.error, message: '$e'),
        );
      }
    });
    on<ZoneAdded>((event, emit) async {
      emit(
        state.copyWith(
          zones: List.of(state.zones)..add(event.zone),
        ),
      );
    });

    on<ZonesModified>((event, emit) async {
      emit(
        state.copyWith(zones: event.zones),
      );
    });
  }

  final CompassRepository repository;
}
