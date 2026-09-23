import 'package:flutter/material.dart';

// ============================================================
// NEW HABIT HEADER
// ============================================================

class NewHabitHeader extends StatelessWidget {
  const NewHabitHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Stack(
        children: [
          _buildBackButton(context),
          _buildTitle(),
          _buildMenuButton(),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // BACK BUTTON
  // ----------------------------------------------------------

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      left: 8,
      top: 14,
      child: _HeaderCircleButton(
        icon: Icons.chevron_left,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // ----------------------------------------------------------
  // TITLE
  // ----------------------------------------------------------

  Widget _buildTitle() {
    return const Positioned(
      left: 0,
      right: 0,
      top: 27,
      child: Center(
        child: Text(
          'New Habit',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // MENU BUTTON
  // ----------------------------------------------------------

  Widget _buildMenuButton() {
    return Positioned(
      right: 8,
      top: 14,
      child: _HeaderCircleButton(
        icon: Icons.more_vert,
        onPressed: () {},
      ),
    );
  }
}

// ============================================================
// HEADER CIRCLE BUTTON
// ============================================================

class _HeaderCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _HeaderCircleButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF1C1C1E),
            ),
          ),
        ),
      ),
    );
  }
}