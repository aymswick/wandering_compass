import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_repository/schedule_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandering_compass_client/l10n/l10n.dart';
import 'package:wandering_compass_client/today/bloc/today_bloc.dart';
import 'package:wandering_compass_client/today/view/clock/circular_countdown_clock.dart';
import 'package:wandering_compass_client/today/view/focus_items.dart'
    show FocusItems;

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodayBloc(context.read<CompassRepository>()),
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

    const zones = <String>[
      'Open',
      'Bootup',
      'Launch',
      'Work',
      'Log',
      'Off',
      'Touchdown',
      'Close',
    ];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.todayAppBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocSelector<TodayBloc, TodayState, double>(
          selector: (state) => state.currentTick,
          builder: (context, dayProgressPercentage) => PageView.builder(
            itemBuilder: (context, index) => switch (index) {
              (0) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.file_open),
                    label: const Text('Choose config file'),
                    onPressed: () => bloc.add(ScheduleFetched()),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await SharedPreferencesAsync().setBool(
                        'has_completed_onboarding',
                        false,
                      );
                      if (context.mounted) {
                        context.go('/');
                      }
                    },
                    child: const Text('Reset'),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: zones.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(zones[index]),
                    ),
                  ),
                ],
              ),
              (1) => CircularCountdownClock(
                progress: dayProgressPercentage,
              ),
              (2) => const FocusItems(),
              (_) => const Text('howd u get here??'),
            },
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
