import 'package:flutter/material.dart';

// ============================================================
// HABIT NAME SECTION
// ============================================================

class HabitNameSection extends StatelessWidget {
  const HabitNameSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------
          // HABIT NAME LABEL
          // ----------------------------------------------------

          const Text(
            'Habit Name',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),

          const SizedBox(height: 7),

          // ----------------------------------------------------
          // HABIT NAME INPUT
          // ----------------------------------------------------

          Container(
            width: double.infinity,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFE9E9EB),
              borderRadius: BorderRadius.circular(22),
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'e.g., Morning Meditation',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8E8E93),
              ),
            ),
          ),
        ],
      ),
    );
  }
}