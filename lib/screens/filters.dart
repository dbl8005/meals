import 'package:flutter/material.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        /// drawer: MainDrawer(onSelectScreen: (identifier) {
        ///   Navigator.of(context).pop();
        ///   if (identifier == 'meals') {
        ///     Navigator.of(context).push(
        ///       MaterialPageRoute(
        ///         builder: (context) => const TabsScreen(),
        ///       ),
        ///     );
        ///   }
        /// }),
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              value: false,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              subtitle: Text(
                'Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            )
          ],
        ));
  }
}
