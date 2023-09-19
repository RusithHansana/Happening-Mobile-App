import 'package:flutter/material.dart';
import 'package:login_pages/widgets/glass_box.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
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
                    child: Column(children: [
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Email",
                            fillColor: Colors.white,
                          ),
                        ),
                      ),

                      //Continue Button//
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.67),
                      //OR//
                      const SizedBox(
                        child: Text(
                          'or',
                          style: TextStyle(color: Colors.white, fontSize: 14),
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
                            'assets/images/facebook.png',
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
                            'assets/images/google.png',
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
                            'assets/images/apple.png',
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
                      const SizedBox(height: 12.67),
                      //link section
                      const SizedBox(
                        child: Text(
                          'Don’t you have an account? Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.w600,),
                        ),
                      ),
                      const SizedBox(
                        child: Text(
                          'Forgot your Password ?',
                          style: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.w600,),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
