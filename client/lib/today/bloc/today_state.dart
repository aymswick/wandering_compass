part of 'today_bloc.dart';

@MappableClass()
class TodayState with TodayStateMappable {
  const TodayState({
    required this.currentTick,
    this.schedule = const Schedule(
      workingHours: 1,
      zones: [''],
      footholds: [''],
    ),
  });

  final double currentTick;
  final Schedule schedule;
}
