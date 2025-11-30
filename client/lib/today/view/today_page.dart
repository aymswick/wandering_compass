import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';
import 'package:wandering_compass_client/today/bloc/today_bloc.dart';
import 'package:wandering_compass_client/today/view/clock_painter.dart';
import 'package:wandering_compass_client/today/view/focus_items.dart';

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
      body: SizedBox.expand(
        child: BlocSelector<TodayBloc, TodayState, double>(
          selector: (state) => state.currentTick,
          builder: (context, dayProgressPercentage) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomPaint(
                  painter: ClockPainter(
                    dayProgressPercentage: dayProgressPercentage,
                  ),
                  child: Center(
                    child: Text(
                      '${(dayProgressPercentage * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Flexible(child: FocusItems()),
            ],
          ),
        ),
      ),
    );
  }
}
