import 'package:flutter/material.dart';
import 'package:home_page/models/event.dart';
import 'package:home_page/widgets/glass_box.dart';

class Tabs extends StatelessWidget {
  const Tabs({required this.categories, super.key});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: Colors.amber[300],
      labelPadding: const EdgeInsets.only(
        right: 8,
      ),
      isScrollable: true,
      unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
      labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
      tabs: [
        for (Category category in categories)
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
            ),
            child: GlassBox(
              borderRadius: 32,
              child: Tab(
                text:
                    category.name[0].toUpperCase() + category.name.substring(1),
              ),
            ),
          ),
      ],
    );
  }
}
