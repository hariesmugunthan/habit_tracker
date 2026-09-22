import 'package:flutter/material.dart';

import '../widgets/choose_duration_icon.dart';
import '../widgets/habit_icon_section.dart';
import '../widgets/habit_name_section.dart';
import '../widgets/new_habit_header.dart';

class NewHabitPage extends StatelessWidget {
  const NewHabitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Soft background for Chrome demo screen
      backgroundColor: const Color(0xFFEFEFEF),

      body: Center(
        child: Container(
          // Fixed mobile frame dimensions for browser demo
          width: 360,
          height: 800,

          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F8),
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: 2,
                color: Color(0x1F000000),
              ),
            ],
          ),

          clipBehavior: Clip.antiAlias,

          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                NewHabitHeader(),
                const SizedBox(height: 8),
                HabitNameSection(),
                const SizedBox(height: 18),
                HabitIconSection(),
                const SizedBox(height: 18),

                ChooseDurationIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
