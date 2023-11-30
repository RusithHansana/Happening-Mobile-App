import 'package:flutter/material.dart';

import 'package:home_page/widgets/profile/profile_event_card.dart';
import 'package:home_page/widgets/tabs/bottom_tabs.dart';

import '/models/account.dart';
import '/widgets/glass_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.account,
  }) : super(key: key);

  final StudentAccount account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/splash_screen/splash-background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/img/profile/profile.png'),
              ),
              const SizedBox(height: 12),
              Text(
                account.studentName,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                account.email,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileEventCard(
                    account: account,
                    title: 'Intersted Events',
                  ),
                  ProfileEventCard(
                    account: account,
                    title: 'Registered Events',
                  ),
                ],
              ),
              const SizedBox(height: 120),
              GlassBox(
                borderRadius: 64,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(
                        vertical: 24,
                      ), // Adjust the padding here
                    ),
                  ),
                  child: const Text('Go To Dashboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
              const Spacer(),
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
