import 'package:flutter/material.dart';

/// Generates a list of InputChips representing localized time suggestions
/// from [startFrom] incrementing by [incrementBy]
class TimeSuggestionChips extends StatefulWidget {
  const TimeSuggestionChips({
    required this.startFrom,
    this.incrementBy = const Duration(hours: 1),
    super.key,
    this.labelText = 'Please select a time',
    this.onTimeSelected,
  });

  final String labelText;
  final TimeOfDay startFrom;
  final Duration incrementBy;
  final void Function(TimeOfDay start)? onTimeSelected;

  @override
  State<TimeSuggestionChips> createState() => _TimeSuggestionChipsState();
}

class _TimeSuggestionChipsState extends State<TimeSuggestionChips> {
  late List<TimeOfDay> times;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: times.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4),
              child: InputChip(
                label: Text(
                  times[index].format(context),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: selectedTime == times[index]
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.primary,
                  ),
                ),
                selected: selectedTime == times[index],
                onPressed: () async {
                  setState(() {
                    if (selectedTime == times[index]) {
                      selectedTime = null;
                    } else {
                      selectedTime = times[index];
                    }
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    times = List.generate(
      5,
      (index) => widget.startFrom.add(widget.incrementBy * index),
    );
    super.initState();
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add(Duration duration) {
    final totalMinutes = (hour * 60) + minute + duration.inMinutes;
    final wrappedMinutes = totalMinutes % 1440;
    return TimeOfDay(hour: wrappedMinutes ~/ 60, minute: wrappedMinutes % 60);
  }
}
