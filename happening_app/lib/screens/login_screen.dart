import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_page/screens/enter_password_screen.dart';

import '/data/dummy_accounts.dart';
import '/models/account.dart';

import '/widgets/glass_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isEmailValid = false;

  void checkEmailValidity() {
    final enteredEmail = emailController.text.trim();
    StudentAccount? matchingStudent;

    try {
      matchingStudent = dummyStudentAccounts.firstWhere(
        (student) => student.email == enteredEmail,
      );
    } catch (e) {
      matchingStudent = null;
    }

    if (matchingStudent != null) {
      // Email is correct, navigate to the password input page and pass the student object.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PasswordScreen(student: matchingStudent!),
        ),
      );
    } else {
      // Email is incorrect, show a snackbar.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email does not match.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Hi!',
                        style: TextStyle(
                            fontSize: 65,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  //Email-Box//
                  GlassBox(
                    borderRadius: 32,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                  horizontal: 32,
                                ),
                                filled: true,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Email",
                                fillColor: Colors.white,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  isEmailValid = value.isNotEmpty;
                                });
                              },
                            ),
                          ),

                          //Continue Button//
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: ElevatedButton(
                              onPressed:
                                  isEmailValid ? checkEmailValidity : null,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor: const Color(0xFF16559B),
                                disabledForegroundColor: Colors.white,
                                disabledBackgroundColor:
                                    const Color(0xFF16559B),
                              ),
                              child: const Text(
                                'Continue',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12.67),
                          //OR//
                          const SizedBox(
                            child: Text(
                              'or',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          const SizedBox(height: 12.67),
                          //fb-log
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              icon: Image.asset(
                                'assets/img/images/facebook.png',
                                width: 24,
                              ),
                              label: const Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //google-log
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              icon: Image.asset(
                                'assets/img/images/google.png',
                                width: 24,
                              ),
                              label: const Text(
                                'Continue with Google',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          //apple-log
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                backgroundColor: Colors.white,
                              ),
                              icon: Image.asset(
                                'assets/img/images/apple.png',
                                width: 24,
                                height: 24,
                              ),
                              label: const Text(
                                'Continue with Apple',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Left-align the content
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: 'Don’t you have an account? ',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFF8AB05),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // Add your action when the clickable part is tapped.
                                          // You can navigate to a new screen, show a dialog, etc.
                                          // For example, let's print a message to the console.
                                          print('Clickable text tapped!');
                                        },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Left-align the content
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/forgotPassword');
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFF8AB05),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //link section
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
