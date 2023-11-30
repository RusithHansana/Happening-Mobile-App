import 'package:flutter/material.dart';

import 'package:home_page/screens/tab_screen.dart';
import '../widgets/tabs/bottom_tabs.dart';
import '../widgets/search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.notifications,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 30),
                child: SearchBarWidget(),
              ),
              const SizedBox(
                height: 8,
              ),
              const Expanded(
                child: TabScreen(),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(
          bottom: 8,
          left: 20,
          right: 20,
        ),
        child: BottomTabBarWidget(),
      ),
    );
  }
}
