import 'package:flutter/material.dart';
import 'package:happening_app/widgets/glass_box.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg.png',
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
                                  AssetImage('assets/images/dp.png'),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Jane Dow",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "jane.doe@gmail.com",
                                  style: TextStyle(
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
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              backgroundColor: const Color.fromARGB(255, 15, 79, 151),
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
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
                                /* children: <TextSpan>[
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
                                ],*/
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
