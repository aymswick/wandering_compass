import 'dart:async' show Timer;

import 'package:bloc/bloc.dart';
import 'package:compass_repository/compass_repository.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:shared/shared.dart';

part 'today_bloc.mapper.dart';
part 'today_event.dart';
part 'today_state.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc(this.repository) : super(const TodayState(currentTick: 0)) {
    on<TimeElapsed>(_advanceTime);
    on<ScheduleFetched>(_setupSchedule);
  }

  CompassRepository repository;
  Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<void> _advanceTime(
    TimeElapsed event,
    Emitter<TodayState> emit,
  ) async {
    final now = DateTime.now();

    final workingMinutes = state.schedule!.workingHours! * 60;

    // Convert current time to a minute count starting from 7:00 AM
    var elapsedMinutes = 0;

    // Check if the current time is within the working span (7:00 AM to 10:00 PM)
    if (now.hour >= 7 && now.hour < 22) {
      // Calculate minutes elapsed since 7:00 AM
      final hoursElapsed = now.hour - 7;

      elapsedMinutes =
          ((hoursElapsed * 60.0) + now.minute + (now.second / 60.0)).toInt();
    } else if (now.hour >= 22 || now.hour < 7) {
      // We set progress to 1.0 because the previous day's work finished at midnight.
      elapsedMinutes = workingMinutes;
    }

    // 2. Calculate the progress percentage, clamped between 0.0 and 1.0
    final rawProgress = elapsedMinutes / workingMinutes;
    final progress = rawProgress.clamp(
      0.0,
      1.0,
    );

    emit(state.copyWith(currentTick: progress));
  }

  Future<void> _setupSchedule(
    ScheduleFetched event,
    Emitter<TodayState> emit,
  ) async {
    final schedule = await repository.getSchedule();

    add(TimeElapsed());
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      add(TimeElapsed());
    });

    emit(
      state.copyWith(
        schedule: schedule,
      ),
    );
  }
}
