import 'package:flutter/material.dart';
import 'package:home_page/data/dummy_accounts.dart';
import 'package:home_page/screens/chat_screen.dart';
import 'package:home_page/screens/home_screen.dart';
import 'package:home_page/screens/profile_screen.dart';
import 'package:home_page/widgets/glass_box.dart';

class BottomTabBarWidget extends StatelessWidget {
  const BottomTabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassBox(
      borderRadius: 32,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
                },
                icon: const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ChatScreen(),
                  ));
                },
                icon: const Icon(
                  Icons.message,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileScreen(
                      account: currentAccount,
                    ),
                  ));
                },
                icon: const Icon(
                  Icons.person_pin,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
