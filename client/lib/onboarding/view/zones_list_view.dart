import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class ZonesListView extends StatefulWidget {
  const ZonesListView({
    required this.zones,
    super.key,
    this.onZonesModified,
    this.onZoneAdded,
  });

  ///
  final List<Zone> zones;

  /// Called when zones edited or deleted;
  /// returns a modified list of zones
  final void Function(List<Zone>)? onZonesModified;

  /// Called when user creates a new zone via the add button
  final void Function(String)? onZoneAdded;

  @override
  State<ZonesListView> createState() => _ZonesListViewState();
}

class _ZonesListViewState extends State<ZonesListView> {
  List<Zone> _zones = [];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ReorderableListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final zone = _zones[index];

            return Card(
              key: Key('reorderable_zone_$index'),

              child: ListTile(
                leading: Text(
                  '${index + 1}',
                  style: theme.textTheme.labelLarge,
                ),
                title: Text(
                  zone.name,
                  style: theme.textTheme.bodyLarge,
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        _zones = _zones..remove(zone);
                        widget.onZonesModified?.call(
                          _zones,
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: theme.colorScheme.error,
                  ),
                ),
                onTap: () => logger.d(zone),
              ),
            );
          },
          itemCount: _zones.length,
          onReorder: (int oldIndex, int newIndex) {
            if (oldIndex < newIndex) {
              newIndex--;
            }

            setState(() {
              final zoneToMove = _zones.removeAt(oldIndex);
              _zones = _zones..insert(newIndex, zoneToMove);
              widget.onZonesModified?.call(_zones);
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final controller = TextEditingController();
                  await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            controller: controller,
                            decoration: const InputDecoration(
                              labelText: 'Zone name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name for this zone';
                              }
                              return null;
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(
                                () {
                                  _zones = _zones
                                    ..add(Zone(name: controller.text));
                                },
                              );
                              widget.onZoneAdded?.call(controller.text);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      );
                    },
                  );
                },
                label: const Text('Add'),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    _zones = List.of(widget.zones);
    super.initState();
  }
}
