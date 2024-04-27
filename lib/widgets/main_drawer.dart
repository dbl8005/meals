// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/theme_provider.dart';

class MainDrawer extends ConsumerStatefulWidget {
  MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  ConsumerState<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends ConsumerState<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeStateProvider);
    Set<String> _selected = {'system'};

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
              ],
            )),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 20),
                Text(
                  'Get Cookin\'',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () {
              widget.onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_list_alt,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: () {
              widget.onSelectScreen('filters');
            },
          ),
          Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.sunny),
          //     const SizedBox(width: 10),
          //     Switch(
          //         value: themeMode == ThemeMode.dark ? true : false,
          //         onChanged: (checked) {
          //           toggleTheme(ref);
          //         }),
          //     const SizedBox(width: 10),
          //     Icon(Icons.nights_stay),
          //   ],
          // ),
          const SizedBox(height: 10),
// segmented button with light, dark, and system theme selection
          Container(
            child: SegmentedButton(
              segments: [
                ButtonSegment(
                  value: 'light',
                  label: Text('Light'),
                ),
                ButtonSegment(
                  value: 'system',
                  label: Text('System'),
                ),
                ButtonSegment(
                  value: 'dark',
                  label: Text('Dark'),
                ),
              ],
              selected: _selected,
              onSelectionChanged: (Set<String> newSelected) {
                setState(() {
                  _selected = newSelected;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
