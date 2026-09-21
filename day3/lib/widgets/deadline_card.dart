import 'package:flutter/material.dart';

// ============================================================================
// DEADLINE CARD WIDGET
// ============================================================================
// This widget renders the "Deadline" box showing:
// 1. "Deadline" label
// 2. Calendar outline icon
// 3. Target date ("12 April")
// ============================================================================

class DeadlineCard extends StatelessWidget {
  final String dateText;

  const DeadlineCard({
    super.key,
    this.dateText = '12 April',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // ----------------------------------------------------------------------
      // 1. CARD SIZING & PADDING
      // ----------------------------------------------------------------------
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),

      // ----------------------------------------------------------------------
      // 2. CARD STYLING & SHADOW
      // ----------------------------------------------------------------------
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000), // Very light soft shadow (4% opacity)
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      // ----------------------------------------------------------------------
      // 3. CARD CONTENT (VERTICAL COLUMN)
      // ----------------------------------------------------------------------
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- [SECTION A] Title Label ---
          const Text(
            'Deadline',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8E8E93), // iOS neutral grey
            ),
          ),

          const SizedBox(height: 10),

          // --- [SECTION B] Calendar Icon ---
          const Icon(
            Icons.calendar_month_outlined,
            size: 26,
            color: Color(0xFF1C1C1E), // Dark primary tint
          ),

          const SizedBox(height: 8),

          // --- [SECTION C] Date Text ---
          Text(
            dateText,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1C1C1E),
            ),
          ),
        ],
      ),
    );
  }
}