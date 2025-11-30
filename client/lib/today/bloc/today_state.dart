part of 'today_bloc.dart';

@MappableClass()
class TodayState with TodayStateMappable {
  const TodayState({required this.currentTick, this.items = const []});

  final double currentTick;
  final List<String> items;
}
