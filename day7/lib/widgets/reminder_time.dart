import 'package:flutter/material.dart';

// ============================================================
// REMINDER TIME
// ============================================================

class ReminderTime extends StatelessWidget {
  const ReminderTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),

          const SizedBox(height: 8),

          _buildTimeContainer(),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // SECTION TITLE
  // ----------------------------------------------------------

  Widget _buildTitle() {
    return const Text(
      'Reminder Time',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1C1E),
      ),
    );
  }

  // ----------------------------------------------------------
  // TIME CONTAINER
  // ----------------------------------------------------------

  Widget _buildTimeContainer() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          _buildBellIcon(),

          const SizedBox(width: 10),

          _buildTimeText(),

          const Spacer(),

          _buildClockIcon(),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // BELL ICON
  // ----------------------------------------------------------

  Widget _buildBellIcon() {
    return const Icon(
      Icons.notifications_none_outlined,
      size: 20,
      color: Color(0xFF666666),
    );
  }

  // ----------------------------------------------------------
  // TIME TEXT
  // ----------------------------------------------------------

  Widget _buildTimeText() {
    return const Text(
      '09:56 PM',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1C1E),
      ),
    );
  }

  // ----------------------------------------------------------
  // CLOCK ICON
  // ----------------------------------------------------------

  Widget _buildClockIcon() {
    return const Icon(
      Icons.access_time_outlined,
      size: 20,
      color: Color(0xFF666666),
    );
  }
}