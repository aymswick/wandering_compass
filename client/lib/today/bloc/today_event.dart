part of 'today_bloc.dart';

class MiddayArrivedEvent extends TodayEvent {}

class MorningArrivedEvent extends TodayEvent {}

class NightArrivedEvent extends TodayEvent {}

@immutable
sealed class TodayEvent {}
