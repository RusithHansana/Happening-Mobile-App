import 'package:flutter/material.dart';
import 'package:home_page/screens/home_screen.dart';

import '/data/dummy_accounts.dart';
import '/models/account.dart';

import '/widgets/glass_box.dart';

class PasswordScreen extends StatefulWidget {
  final StudentAccount student;

  const PasswordScreen({super.key, required this.student});

  @override
  State createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void upDateCurrentAccount(StudentAccount account) {
    currentAccount = account;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void checkPasswordValidity() {
    final enteredPassword = passwordController.text;
    if (widget.student != null && enteredPassword == widget.student!.password) {
      // Password is correct, navigate to another page.
      // You can add your navigation logic here.

      upDateCurrentAccount(widget.student);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Log In',
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
                  const SizedBox(height: 12.67),
                  //Glass-Box//
                  GlassBox(
                    borderRadius: 32,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(children: [
                        //Avatar

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  AssetImage('assets/img/images/dp.png'),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  widget.student.studentName,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  widget.student.email,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            )
                          ]),
                        ),

                        const SizedBox(height: 12.67),

                        //-pass-text
                        SizedBox(
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 17,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12.67),
                        //Continue
                        SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              checkPasswordValidity();
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 15, 79, 151),
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
                        //link section
                        const Row(
                          mainAxisAlignment:
                              MainAxisAlignment.start, // Left-align the content
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Forgot your Password ? ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
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
