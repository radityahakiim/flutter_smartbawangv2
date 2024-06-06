import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/state/login_register/intro.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const IntroPage(),
        title: 'Smart Bawang',
        theme: ThemeData(
            textTheme: TextTheme(
          bodyMedium: GoogleFonts.nunito(),
          displayLarge: GoogleFonts.nunito(),
          titleLarge: GoogleFonts.nunito(),
        )));
  }
}
