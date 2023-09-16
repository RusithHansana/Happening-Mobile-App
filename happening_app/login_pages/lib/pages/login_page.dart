import 'package:flutter/material.dart';
import 'package:login_pages/components/frostedglass.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: const FrostedGlassBox(
          theWidth: 330.0,
          theHeight: 480.0,
          theChild: Text(
            'Hello World!',
            style: TextStyle(color: Colors.white54, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
