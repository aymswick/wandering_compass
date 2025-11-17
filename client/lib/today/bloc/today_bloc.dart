import 'dart:async' show Timer;

import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:meta/meta.dart';
import 'package:schedule_repository/schedule_repository.dart'
    show ScheduleRepository;

part 'today_bloc.mapper.dart';
part 'today_event.dart';
part 'today_state.dart';

// TODO(ant): store this value in schedulerepo / user prefs
const double workingSpanMinutes =
    900; // The total span of the working day in minutes (15 hours: 7 AM to 10 PM)

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  TodayBloc(this.repository) : super(const TodayState(currentTick: 0)) {
    on<TimeElapsed>(_advanceTime);
    _startTracking();
  }

  ScheduleRepository repository;
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
      elapsedMinutes = workingSpanMinutes.toInt();
    }

    // 2. Calculate the progress percentage, clamped between 0.0 and 1.0
    final rawProgress = elapsedMinutes / workingSpanMinutes;
    final progress = rawProgress.clamp(
      0.0,
      1.0,
    ); // Ensure it doesn't go over 1.0

    emit(state.copyWith(currentTick: progress));
  }

  void _startTracking() {
    // 1. Post the initial event right away
    add(TimeElapsed());

    // 2. Set up a periodic timer to post the event every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      add(TimeElapsed());
    });
  }
}
