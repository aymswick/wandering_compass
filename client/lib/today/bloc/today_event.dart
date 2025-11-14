part of 'today_bloc.dart';

class ClockTicked extends TodayEvent {}

class MiddayArrivedEvent extends TodayEvent {}

class MorningArrivedEvent extends TodayEvent {}

class NightArrivedEvent extends TodayEvent {}

@immutable
sealed class TodayEvent {}
