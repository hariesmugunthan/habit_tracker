import 'package:flutter/material.dart';

// ============================================================================
// CUSTOM BOTTOM NAVIGATION BAR WIDGET
// ============================================================================
// Displays:
// 1. Home tab (active indicator)
// 2. Calendar tab
// 3. Floating center '+' Add button
// 4. Analytics tab
// 5. Profile tab
// ============================================================================

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTabSelected;
  final VoidCallback? onAddPressed;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0, // 0 = Home is active by default
    this.onTabSelected,
    this.onAddPressed,
  });

  // Theme primary coral color matching mockup
  static const Color primaryCoral = Color(0xFFFF806B);
  static const Color inactiveGrey = Color(0xFF8E8E93);

  @override
  Widget build(BuildContext context) {
    return Container(
      // ----------------------------------------------------------------------
      // 1. FLOATING BAR CONTAINER STYLING
      // ----------------------------------------------------------------------
      height: 72,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000), // Soft floating shadow
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),

      // ----------------------------------------------------------------------
      // 2. NAVIGATION ICONS & CENTER PLUS BUTTON ROW
      // ----------------------------------------------------------------------
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // --- [TAB 0] Home ---
          _buildNavItem(
            index: 0,
            icon: Icons.home_rounded,
            label: 'Home',
          ),

          // --- [TAB 1] Calendar ---
          _buildNavItem(
            index: 1,
            icon: Icons.calendar_month_outlined,
            label: 'Calendar',
          ),

          // --- [CENTER ACTION] '+' Add Habit Button ---
          GestureDetector(
            onTap: onAddPressed,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFFF927F),
                    Color(0xFFFF6E58),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: primaryCoral.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),

          // --- [TAB 2] Analytics ---
          _buildNavItem(
            index: 2,
            icon: Icons.analytics_outlined,
            label: 'Analytics',
          ),

          // --- [TAB 3] Profile ---
          _buildNavItem(
            index: 3,
            icon: Icons.person_outline_rounded,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // --------------------------------------------------------------------------
  // HELPER METHOD: Builds an individual navigation tab item
  // --------------------------------------------------------------------------
  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    final bool isSelected = (currentIndex == index);
    final Color itemColor = isSelected ? primaryCoral : inactiveGrey;

    return InkWell(
      onTap: () => onTabSelected?.call(index),
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: itemColor,
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: itemColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}