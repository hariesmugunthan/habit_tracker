import 'package:flutter/material.dart';

// ============================================================
// HABIT ICON SECTION
// ============================================================

class HabitIconSection extends StatelessWidget {
  const HabitIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ----------------------------------------------------
          // TITLE
          // ----------------------------------------------------

          const Text(
            'Choose Icon',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          // ----------------------------------------------------
          // FIRST ROW
          // ----------------------------------------------------

          Row(
            children: [

              // =================================================
              // YOGA - SELECTED
              // =================================================

              Expanded(
                child: Container(
                  height: 78,

                  decoration: BoxDecoration(
                    color: const Color(0xFFF8ECE0),
                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(
                      color: const Color(0xFFFF806B),
                      width: 1,
                    ),

                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0A000000),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        '🧘',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        'Yoga',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // =================================================
              // SINGING
              // =================================================

              Expanded(
                child: _buildIconCard('🎵', 'Singing'),
              ),

              const SizedBox(width: 8),

              // =================================================
              // READING
              // =================================================

              Expanded(
                child: _buildIconCard('📚', 'Reading'),
              ),

              const SizedBox(width: 8),

              // =================================================
              // RUNNING
              // =================================================

              Expanded(
                child: _buildIconCard('🏃', 'Running'),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // ----------------------------------------------------
          // SECOND ROW
          // ----------------------------------------------------

          Row(
            children: [

              Expanded(
                child: _buildIconCard('💤', 'Sleeping'),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _buildIconCard('🎨', 'Drawing'),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _buildIconCard('🚴', 'Cycling'),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _buildIconCard('⊞', 'All In'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // COMMON ICON CARD
  // ==========================================================

  Widget _buildIconCard(String icon, String name) {
    return Container(
      height: 78,

      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(12),

        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            icon,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            name,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}