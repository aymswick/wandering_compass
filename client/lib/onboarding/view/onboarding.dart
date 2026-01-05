import 'package:compass_repository/compass_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wandering_compass_client/onboarding/bloc/onboarding_bloc.dart';

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
  TextEditingController workingHoursController = TextEditingController();
  TextEditingController zonesController = TextEditingController();
  TextEditingController footholdsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    return Form(
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
            TextFormField(
              controller: workingHoursController,
              decoration: const InputDecoration(
                labelText: 'Working Hours',
              ),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a number between 1 and 24';
                }
                return null;
              },
            ),
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                      bloc.add(
                        CompassDataCreated(
                          name: nameController.text,
                          workingHours: int.parse(workingHoursController.text),
                          zones: zonesController.text.split(','),
                          footholds: footholdsController.text.split(','),
                        ),
                      );

                      // TODO(ant): remove this artificial flag standing in for real auth
                      await SharedPreferencesAsync().setBool(
                        'has_completed_onboarding',
                        true,
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
  }
}
