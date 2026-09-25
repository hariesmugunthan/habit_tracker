import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

// ============================================================
// APP ROOT
// ============================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',

      // ---------- APP THEME ----------
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        
         // Sets Poppins as the universal typography system for the entire app!
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      // ---------- HOME PAGE ----------
      home: const MyHomePage(title: 'Habit Tracker'),
    );
  }
}
