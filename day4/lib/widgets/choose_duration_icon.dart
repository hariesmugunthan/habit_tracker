import 'package:flutter/material.dart';

// ============================================================
// CHOOSE DURATION ICON
// ============================================================

class ChooseDurationIcon extends StatefulWidget {
  const ChooseDurationIcon({super.key});

  @override
  State<ChooseDurationIcon> createState() => _ChooseDurationIconState();
}

class _ChooseDurationIconState extends State<ChooseDurationIcon> {
  int selectedIndex = 0;

  final List<String> durations = [
    'Daily',
    'Weekdays',
    'Weekends',
    'Custom',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),

          const SizedBox(height: 8),

          _buildDurationGrid(),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // SECTION TITLE
  // ----------------------------------------------------------

  Widget _buildTitle() {
    return const Text(
      'Choose Icon',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color(0xFF1C1C1E),
      ),
    );
  }

  // ----------------------------------------------------------
  // DURATION GRID
  // ----------------------------------------------------------

  Widget _buildDurationGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: durations.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 7,
        childAspectRatio: 2.35,
      ),
      itemBuilder: (context, index) {
        return _buildDurationButton(index);
      },
    );
  }

  // ----------------------------------------------------------
  // DURATION BUTTON
  // ----------------------------------------------------------

  Widget _buildDurationButton(int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFFF806B)
              : Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        alignment: Alignment.center,
        child: Text(
          durations[index],
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: isSelected
                ? const Color(0xFF1C1C1E)
                : const Color(0xFF8E8E93),
          ),
        ),
      ),
    );
  }
}