import 'package:flutter/material.dart';

import 'package:happening_app/models/account.dart';

class PasswordPage extends StatefulWidget {
  final StudentAccount? student;

  const PasswordPage({super.key, required this.student});

  @override
  State createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void checkPasswordValidity() {
    final enteredPassword = passwordController.text;
    if (widget.student != null && enteredPassword == widget.student!.password) {
      // Password is correct, navigate to another page.
      // You can add your navigation logic here.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password is correct.'),
        ),
      );
    } else {
      // Password is incorrect, show a snackbar.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Incorrect password.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Enter Password'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkPasswordValidity,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
