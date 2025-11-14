import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:schedule_repository/schedule_repository.dart'
    show ScheduleRepository;

part 'today_bloc.mapper.dart';
part 'today_event.dart';
part 'today_state.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc(this.repository) : super(const TodayState(currentTick: 0)) {
    on<ClockTicked>(_advanceClockProgress);
  }

  ScheduleRepository repository;
  Future<void> _advanceClockProgress(
    ClockTicked event,
    Emitter<TodayState> emit,
  ) async {
    emit(state.copyWith(currentTick: state.currentTick + 1));
    print('tick');
  }
}
