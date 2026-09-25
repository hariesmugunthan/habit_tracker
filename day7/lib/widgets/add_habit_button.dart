import 'package:flutter/material.dart';

// ============================================================
// ADD HABIT BUTTON
// ============================================================

class AddHabitButton extends StatelessWidget {
  const AddHabitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFB27D),
            Color(0xFFFF936F),
            Color(0xFFFF6F63),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      alignment: Alignment.center,
      child: const Text(
        'Add Habit',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1C1C1E),
        ),
      ),
    );
  }
}