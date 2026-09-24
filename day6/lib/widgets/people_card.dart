import 'package:flutter/material.dart';

// ============================================================================
// PEOPLE CARD WIDGET
// ============================================================================
// Displays:
// 1. "People" label
// 2. Three overlapping character avatars with white boundary borders
// ============================================================================

class PeopleCard extends StatelessWidget {
  const PeopleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ----------------------------------------------------------------------
      // 1. CARD SIZING & PADDING (Matches DeadlineCard)
      // ----------------------------------------------------------------------
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),

      // ----------------------------------------------------------------------
      // 2. CARD DECORATION & SHADOW
      // ----------------------------------------------------------------------
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000), // Subtle 4% shadow
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),

      // ----------------------------------------------------------------------
      // 3. CARD CONTENT (VERTICAL COLUMN)
      // ----------------------------------------------------------------------
      child: Transform.translate(
        offset: const Offset(0, -6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- [SECTION A] Title Label ---
            const Text(
              'People',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8E8E93),
              ),
            ),

            const SizedBox(height: 14),

            // --- [SECTION B] Overlapping Avatars Stack ---
            // Total width = 34 + 22 + 22 = 78px
            SizedBox(
              width: 90,
              height: 48,
              child: Stack(
                children: [
                  // Avatar 1: Left (Pastel Blue)
                  // LEFT — behind center
                  Positioned(
                    left: 0,
                    top: 5,
                    child: _buildAvatarCircle(
                      backgroundColor: const Color(0xFFCBE7FE),
                      childText: '👱‍♀️',
                      size: 36,
                    ),
                  ),

                  // RIGHT — behind center
                  Positioned(
                    left: 49,
                    top: 5,
                    child: _buildAvatarCircle(
                      backgroundColor: const Color(0xFFD7EED8),
                      childText: '👨‍🦱',
                      size: 36,
                    ),
                  ),

                  // CENTER — LAST = IN FRONT
                  Positioned(
                    left: 18,
                    top: 0,
                    child: _buildAvatarCircle(
                      backgroundColor: const Color(0xFFFFDFD0),
                      childText: '🧒',
                      size: 48,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --------------------------------------------------------------------------
  // HELPER METHOD: Builds a single avatar with a crisp white border ring
  // --------------------------------------------------------------------------
  Widget _buildAvatarCircle({
    required Color backgroundColor,
    required String childText,
    double size = 36,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        // The white border creates the clean overlapping cut-out effect
        border: Border.all(color: Colors.white, width: 2.5),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Text(childText, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
