import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';
import 'package:wandering_compass_client/today/bloc/today_bloc.dart';
import 'package:wandering_compass_client/today/view/clock_painter.dart';

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

    Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) => bloc.add(ClockTicked()),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.todayAppBarTitle)),
      body: Center(
        child: SizedBox.expand(
          child: BlocBuilder<TodayBloc, TodayState>(
            builder: (context, state) {
              return CustomPaint(
                painter: ClockPainter(progress: state.currentTick),
              );
            },
          ),
        ),
      ),
    );
  }
}
