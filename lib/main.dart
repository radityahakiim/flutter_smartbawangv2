import 'package:flutter/material.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_controller.dart';
import 'package:flutter_smartbawangv2/db_local/auth/auth_service.dart';
// import 'package:flutter_smartbawangv2/db_local/user_model.dart';
import 'package:flutter_smartbawangv2/state/intro.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthController()),
    ChangeNotifierProvider(create: (_) => AuthService()),
  ], child: const MainApp()));
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
