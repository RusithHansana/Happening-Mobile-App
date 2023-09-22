import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_page/screens/home_screen.dart';
import 'package:home_page/screens/login_screen.dart';

void main() {
  runApp(
    //wrapping with ProviderScope to access riverpod throughout the app
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

final themeHappening = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 30, 144, 255),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData().copyWith(
        color: Colors.white,
      ),
    ));

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeHappening,
      home: const LoginPage(),
    );
  }
}
