import 'package:flutter/material.dart';

// ============================================================
// HABIT ICON SECTION
// ============================================================

class HabitIconSection extends StatefulWidget {
  const HabitIconSection({super.key});

  @override
  State<HabitIconSection> createState() => _HabitIconSectionState();
}

class _HabitIconSectionState extends State<HabitIconSection> {
  int selectedIndex = 0;

  final List<Map<String, String>> icons = [
    {'icon': '🧘', 'name': 'Yoga'},
    {'icon': '🎵', 'name': 'Singing'},
    {'icon': '📚', 'name': 'Reading'},
    {'icon': '🏃', 'name': 'Running'},
    {'icon': '💤', 'name': 'Sleeping'},
    {'icon': '🎨', 'name': 'Drawing'},
    {'icon': '🚴', 'name': 'Cycling'},
    {'icon': '⊞', 'name': 'All In'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(),
          const SizedBox(height: 8),
          _buildIconGrid(),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // SECTION TITLE
  // ----------------------------------------------------------

  Widget _buildSectionTitle() {
    return const Text(
      'Choose Icon',
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }

  // ----------------------------------------------------------
  // ICON GRID
  // ----------------------------------------------------------

  Widget _buildIconGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: icons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 6,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        return _buildIconCard(index);
      },
    );
  }

  // ----------------------------------------------------------
  // INDIVIDUAL ICON CARD
  // ----------------------------------------------------------

  Widget _buildIconCard(int index) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFDFDFD),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF806B)
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              icons[index]['icon']!,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              icons[index]['name']!,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}