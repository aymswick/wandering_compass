import 'package:compass_repository/compass_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanderers_compass/onboarding/bloc/onboarding_bloc.dart';
import 'package:wanderers_compass/onboarding/view/time_suggestion_chips.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) =>
          OnboardingBloc(repository: context.read<CompassRepository>()),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  late TimeOfDay dayStartTime;
  late TimeOfDay dayEndTime;
  TextEditingController zonesController = TextEditingController();
  TextEditingController footholdsController = TextEditingController();
  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    final bloc = context.read<OnboardingBloc>();
    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listener: (context, state) async {
        if (state.status == OnboardingStatus.complete) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  'Success!',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ),
            );

          await SharedPreferencesAsync().setBool(
            'has_completed_onboarding',
            true,
          ); // TODO(ant): remove this in favor of real auth check
          if (context.mounted) {
            context.go('/');
          }
        } else if (state.status == OnboardingStatus.error) {
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(
              SnackBar(
                content: Text('Error: ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      builder: (context, state) {
        return state.status == OnboardingStatus.loading
            ? const CircularProgressIndicator.adaptive()
            : Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    spacing: 8,
                    children: <Widget>[
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter name for this schedule';
                          }
                          return null;
                        },
                      ),
                      TimeSuggestionChips(
                        labelText: 'What time do you start your day?',
                        startFrom: const TimeOfDay(hour: 5, minute: 0),
                        onTimeSelected: (start) =>
                            setState(() => dayStartTime = start),
                      ),
                      TimeSuggestionChips(
                        labelText: 'When do you get into bed?',
                        startFrom: const TimeOfDay(hour: 20, minute: 0),
                        incrementBy: const Duration(minutes: 30),
                        onTimeSelected: (end) =>
                            setState(() => dayEndTime = end),
                      ),

                      // TODO(ant): offer defaults (open, work, close)
                      TextFormField(
                        controller: zonesController,
                        decoration: const InputDecoration(
                          labelText: 'Zones (comma separated list)',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter zones separated by a comma';
                          }
                          return null;
                        },
                      ),
                      // TODO(ant): Move foothold collection to inside the zone page
                      TextFormField(
                        controller: footholdsController,
                        decoration: const InputDecoration(
                          labelText: 'Footholds (comma separated list)',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter footholds separated by a comma';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                bloc.add(
                                  CompassDataCreated(
                                    name: nameController.text,
                                    dayStart: DateTime(
                                      now.year,
                                      now.month,
                                      now.day,
                                      dayStartTime.hour,
                                      dayStartTime.minute,
                                    ),
                                    dayEnd: DateTime(
                                      now.year,
                                      now.month,
                                      now.day,
                                      dayEndTime.hour,
                                      dayEndTime.minute,
                                    ),
                                    zones: zonesController.text.trim().split(
                                      ',',
                                    ),
                                  ),
                                );

                                if (context.mounted) {
                                  context.go('/');
                                }
                              }
                            },
                            label: const Text('Continue'),
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  @override
  void initState() {
    dayStartTime = TimeOfDay.fromDateTime(now);
    dayEndTime = TimeOfDay.fromDateTime(now.add(const Duration(hours: 12)));
    super.initState();
  }
}
