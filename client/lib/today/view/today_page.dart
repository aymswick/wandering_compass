import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';
import 'package:wandering_compass_client/today/bloc/today_bloc.dart';
import 'package:wandering_compass_client/today/view/clock_painter.dart';
import 'package:wandering_compass_client/today/view/focus_items.dart';

class CircularCountdownClock extends StatelessWidget {
  const CircularCountdownClock({
    required this.progress,
    super.key,
  });

  /// Decimal between 0.0 and 1.0 representing day progress
  final double progress;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return CustomPaint(
      size: Size(size.height * .4, size.width / 2),
      painter: ClockPainter(
        dayProgressPercentage: progress,
      ),
      child: Center(
        child: Text(
          '${(progress * 100).toStringAsFixed(0)}%',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodayBloc(context.read<ScheduleRepository>()),
      child: const TodayView(),
    );
  }
}

class TodayView extends StatelessWidget {
  const TodayView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bloc = context.read<TodayBloc>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.todayAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocSelector<TodayBloc, TodayState, double>(
          selector: (state) => state.currentTick,
          builder: (context, dayProgressPercentage) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CircularCountdownClock(
                  progress: dayProgressPercentage,
                ),
              ),
              const Expanded(child: Flexible(child: FocusItems())),
            ],
          ),
        ),
      ),
    );
  }
}
