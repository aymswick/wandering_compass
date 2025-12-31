part of 'today_bloc.dart';

@MappableClass()
class TodayState with TodayStateMappable {
  const TodayState({
    required this.currentTick,
    this.workingHours = 24,
    this.items = const [],
  });

  final double currentTick;
  final int workingHours;
  final List<String> items;
}
