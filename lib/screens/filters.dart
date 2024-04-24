import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
// import 'package:meals/screens/tabs_screen.dart';
// import 'package:meals/widgets/main_drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegeterianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    final activeFilters = ref.read(filtersProvider);
    super.initState();
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegeterianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }

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
        body: PopScope(
          onPopInvoked: (bool didPop) {
            ref.read(filtersProvider.notifier).setFilters({
              Filter.glutenFree: _glutenFreeFilterSet,
              Filter.lactoseFree: _lactoseFreeFilterSet,
              Filter.vegetarian: _vegeterianFilterSet,
              Filter.vegan: _veganFilterSet,
            });
          },
          child: Column(
            children: [
              SwitchListTile(
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                value: _glutenFreeFilterSet,
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
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                  });
                },
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                title: Text(
                  'Vegeterian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                value: _vegeterianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegeterianFilterSet = isChecked;
                  });
                },
                subtitle: Text(
                  'Only include vegeterian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFilterSet = isChecked;
                  });
                },
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ));
  }
}
