import 'package:flutter/material.dart';

// ============================================================
// CHOOSE DURATION
// ============================================================

class ChooseDurationIcon extends StatelessWidget {
  const ChooseDurationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ----------------------------------------------------
          // TITLE
          // ----------------------------------------------------

          const Text(
            'Choose Duration',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1C1C1E),
            ),
          ),

          const SizedBox(height: 8),

          // ----------------------------------------------------
          // FIRST ROW
          // ----------------------------------------------------
          Row(
            children: [
              // DAILY
              Expanded(
                child: Container(
                  height: 45,

                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
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
                    'Daily',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1C1C1E),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // WEEKDAYS
              Expanded(child: _buildDurationButton('Weekdays')),
            ],
          ),

          const SizedBox(height: 7),

          // ----------------------------------------------------
          // SECOND ROW
          // ----------------------------------------------------
          Row(
            children: [
              // WEEKENDS
              Expanded(child: _buildDurationButton('Weekends')),

              const SizedBox(width: 8),

              // CUSTOM
              Expanded(child: _buildDurationButton('Custom')),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // OTHER DURATION BUTTONS
  // ==========================================================

  Widget _buildDurationButton(String text) {
    return Container(
      height: 45,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      alignment: Alignment.center,

      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF8E8E93),
        ),
      ),
    );
  }
}
