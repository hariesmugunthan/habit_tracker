import 'package:flutter/material.dart';
import '../models/habit.dart';
import 'package:flutter/cupertino.dart';

// ============================================================================
// HABIT CARD WIDGET
// ============================================================================
// Renders a single habit item:
// 1. Habit icon inside rounded container
// 2. Title & streak count
// 3. Circular check toggle button
// ============================================================================

class HabitCard extends StatelessWidget {
  final Habit habit;
  final VoidCallback onToggle;

  const HabitCard({
    super.key,
    required this.habit,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ----------------------------------------------------------------------
      // 1. CARD CONTAINER SPACING & DECORATION
      // ----------------------------------------------------------------------
      margin: const EdgeInsets.only(bottom: 7.5),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000), // Very light 3% shadow
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
        border: Border.all(
          color: const Color(0xFFF2F2F7), // Subtle divider border
          width: 1.0,
        ),
      ),

      // ----------------------------------------------------------------------
      // 2. CARD CONTENT (HORIZONTAL ROW)
      // ----------------------------------------------------------------------
      child: Row(
        children: [
          // --- [SECTION A] Habit Icon Box ---
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                habit.icon,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),

          const SizedBox(width: 14),

          // --- [SECTION B] Habit Title & Flame Streak ---
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  habit.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 4),

                // Streak (Flame + days)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.flame,
                      size: 18,
                      color: Color.fromARGB(255, 245, 135, 32),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${habit.streak} days',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8E8E93),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // --- [SECTION C] Custom Circular Check Toggle Button ---
          GestureDetector(
            onTap: onToggle,
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // If completed -> Coral fill; If not completed -> Transparent with grey border
                color: habit.completed
                    ? const Color(0xFFFF806B)
                    : Colors.transparent,
                border: Border.all(
                  color: habit.completed
                      ? const Color(0xFFFF806B)
                      : const Color(0xFFD1D1D6),
                  width: 2.0,
                ),
              ),
              child: habit.completed
                  ? const Center(
                      child: Icon(
                        Icons.check,
                        size: 11,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}