import 'package:flutter/material.dart';

import '../widgets/add_habit_button.dart';
import '../widgets/choose_duration_icon.dart';
import '../widgets/habit_icon_section.dart';
import '../widgets/habit_name_section.dart';
import '../widgets/new_habit_header.dart';
import '../widgets/reminder_time.dart';
import '../widgets/custom_bottom_nav_bar.dart';

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

          child: Stack(
            children: [
              // ============================================================
              // SCROLLABLE NEW HABIT CONTENT
              // ============================================================

              Positioned.fill(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 10, bottom: 90),
                  child: Column(
                    children: [
                      NewHabitHeader(),

                      const SizedBox(height: 8),

                      HabitNameSection(),

                      const SizedBox(height: 30),

                      HabitIconSection(),

                      const SizedBox(height: 20),

                      ChooseDurationIcon(),

                      const SizedBox(height: 18),

                      ReminderTime(),

                      const SizedBox(height: 12),

                      AddHabitButton(),
                    ],
                  ),
                ),
              ),

              // ============================================================
              // FIXED BOTTOM NAVIGATION BAR
              // ============================================================
              Positioned(
                left: 0,
                right: 0,
                bottom: 4,
                child: CustomBottomNavBar(currentIndex: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
