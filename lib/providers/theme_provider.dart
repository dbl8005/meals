import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//create fucntion to toggle the theme.
final themeModeStateProvider = StateProvider<ThemeMode?>((ref) {
  return ThemeMode.light;
});

void toggleTheme(WidgetRef ref) {
  ref.read(themeModeStateProvider.notifier).state =
      ref.read(themeModeStateProvider.notifier).state == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
}
