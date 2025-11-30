import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wandering_compass_client/today/bloc/today_bloc.dart';

class FocusItems extends StatelessWidget {
  const FocusItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodayBloc, TodayState, List<String>>(
      selector: (state) {
        return state.items;
      },
      builder: (context, items) {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) => ListTile(
            leading: Text('$index'),
            title: Text(items[index]),
          ),
          separatorBuilder: (context, index) => const Divider(),
        );
      },
    );
  }
}
