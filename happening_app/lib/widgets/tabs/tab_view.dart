import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../event/event_card.dart';

class TabView extends StatelessWidget {
  const TabView({required this.categories, super.key});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        for (Category category in categories)
          Padding(
            padding: const EdgeInsets.only(
              top: 0,
              bottom: 50,
            ),
            child: EventCard(
              category: category,
            ),
          ),
      ],
    );
  }
}
