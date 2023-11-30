import 'package:flutter/material.dart';

import 'package:home_page/models/event.dart';
import 'package:home_page/widgets/tabs/tab_view.dart';
import 'package:home_page/widgets/tabs/text_row.dart';

import '../widgets/tabs/tabs.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = Category.values;
    //using a function to keep it more linear

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/splash_screen/splash-background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: DefaultTabController(
          length: categories.length,
          child: const Column(
            children: [
              Tabs(
                categories: categories,
              ),
              TextRow(),
              Expanded(
                child: TabView(
                  categories: categories,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
