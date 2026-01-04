part of 'today_bloc.dart';

@MappableClass()
class TodayState with TodayStateMappable {
  const TodayState({
    required this.currentTick,
    this.schedule,
  });

  final double currentTick;
  final Schedule? schedule;
}
