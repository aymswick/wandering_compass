import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wandering_compass_client/today/bloc/today_bloc.dart';

class FocusItems extends StatelessWidget {
  const FocusItems({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocSelector<TodayBloc, TodayState, List<String>>(
      selector: (state) {
        return state.items;
      },
      builder: (context, items) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text('$index', style: theme.textTheme.headlineSmall),
            title: Text(
              items[index],
              style: theme.textTheme.headlineSmall,
            ),
          ),
        );
      },
    );
  }
}
