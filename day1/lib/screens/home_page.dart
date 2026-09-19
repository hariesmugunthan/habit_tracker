import 'package:flutter/material.dart';

import '../models/habit.dart';

// ============================================================
// HOME PAGE
// ============================================================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ============================================================
// HOME PAGE STATE
// ============================================================

class _MyHomePageState extends State<MyHomePage> {
  // ============================================================
  // HABIT LIST
  // ============================================================

  final List<Habit> habits = [
    Habit(name: 'Morning Meditation', icon: '🧘', streak: 12, completed: true),
    Habit(name: 'Read 30 minutes', icon: '📚', streak: 8, completed: false),
    Habit(
      name: 'Drink 8 Glasses Water',
      icon: '💧',
      streak: 15,
      completed: true,
    ),
    Habit(name: 'Exercise', icon: '🏃', streak: 5, completed: false),
  ];
  // ============================================================
  // DAILY PROGRESS CALCULATIONS
  // ============================================================

  int get completedHabits {
    return habits.where((habit) => habit.completed).length;
  }

  double get progress {
    if (habits.isEmpty) {
      return 0;
    }

    return completedHabits / habits.length;
  }

  int get percentage {
    return (progress * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ========================================================
      // MAIN BACKGROUND
      // ========================================================

      backgroundColor: const Color(0xFFEFEFEF),

      body: Center(
        child: Container(
          // ======================================================
          // MOBILE SCREEN SIZE
          // Change width/height here if needed
          // ======================================================

          width: 360,
          height: 800,

          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(28),

            // ---------- SCREEN SHADOW ----------
            boxShadow: [
              BoxShadow(blurRadius: 20, spreadRadius: 2, color: Colors.black12),
            ],
          ),

          clipBehavior: Clip.antiAlias,

          // ======================================================
          // SAFE AREA
          // ======================================================
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              // ==================================================
              // MAIN COLUMN
              // Contains scrollable content + fixed bottom nav
              // ==================================================
              child: Column(
                children: [
                  // ==================================================
                  // SCROLLABLE CONTENT AREA
                  // ==================================================

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ==================================================
                          // HEADER SECTION
                          // Date + Today's Habits + Profile Icon
                          // ==================================================

                          // ==================================================
                          // HEADER SECTION
                          // Date + Today's Habits + Profile Icon
                          // ==================================================
                          Padding(
                            padding: const EdgeInsets.only(top: 58),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // ---------- SETTINGS ICON ----------
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.tune, size: 20),
                                  ),
                                ),

                                const SizedBox(width: 8),

                                // ---------- DATE + TITLE ----------
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ---------- DATE ----------
                                      Text(
                                        'Sunday, May 3',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),

                                      SizedBox(height: 3),

                                      // ---------- TITLE ----------
                                      Text(
                                        "Today's Habits",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // ---------- PROFILE ICON ----------
                                const CircleAvatar(
                                  radius: 22,
                                  child: Icon(Icons.person, size: 22),
                                ),
                              ],
                            ),
                          ),

                          // ---------- HEADER → PROGRESS GAP ----------
                          const SizedBox(height: 20),

                          // ==================================================
                          // DAILY PROGRESS CARD
                          // Change progress, percentage, streak, etc. here
                          // ==================================================
                          // ============================================================
                          // DAILY PROGRESS CARD
                          // ============================================================
                          Container(
                            width: double.infinity,
                            height: 145,
                            padding: const EdgeInsets.all(14),

                            decoration: BoxDecoration(
                              color: const Color(0xFFFFEEE5),
                              borderRadius: BorderRadius.circular(20),
                            ),

                            child: Stack(
                              children: [
                                // ========================================================
                                // DAILY PROGRESS TITLE
                                // ========================================================

                                const Positioned(
                                  left: 4,
                                  top: 4,
                                  child: Text(
                                    'Daily Progress',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),

                                // ========================================================
                                // COMPLETED COUNT
                                // ========================================================
                                Positioned(
                                  left: 4,
                                  top: 38,
                                  child: Text(
                                    '$completedHabits/${habits.length} completed',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),

                                // ========================================================
                                // PROGRESS CIRCLE
                                // ========================================================
                                Positioned(
                                  right: 4,
                                  top: 28,
                                  child: SizedBox(
                                    width: 42,
                                    height: 42,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                          value: progress,
                                          strokeWidth: 6,
                                          backgroundColor: Colors.black12,
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                Color
                                              >(Color(0xFFFF806B)),
                                        ),

                                        Text(
                                          '$percentage%',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // ========================================================
                                // BEST STREAK
                                // ========================================================
                                const Positioned(
                                  left: 4,
                                  bottom: 2,
                                  child: Text(
                                    '🔥 Best streak: 15 days',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // ==================================================
                          // DEADLINE + PEOPLE SECTION
                          // ==================================================
                          const SizedBox(height: 16),

                          Row(
                            children: [
                              // ==================================================
                              // DEADLINE CARD
                              // ==================================================

                              Expanded(
                                child: Container(
                                  // Change card height here
                                  height: 121,

                                  padding: const EdgeInsets.all(16),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),

                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // ---------- DEADLINE TITLE ----------
                                      Text(
                                        'Deadline',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),

                                      SizedBox(height: 12),

                                      // ---------- CALENDAR ICON ----------
                                      Icon(
                                        Icons.calendar_month_outlined,
                                        size: 28,
                                      ),

                                      SizedBox(height: 8),

                                      // ---------- DEADLINE DATE ----------
                                      Text(
                                        '12 April',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              // ==================================================
                              // PEOPLE CARD
                              // ==================================================
                              Expanded(
                                child: Container(
                                  // Change card height here
                                  height: 121,

                                  padding: const EdgeInsets.all(16),

                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18),
                                  ),

                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // ---------- PEOPLE TITLE ----------
                                      Text(
                                        'People',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),

                                      SizedBox(height: 12),

                                      // ---------- PEOPLE ICONS ----------
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            child: Icon(Icons.person, size: 16),
                                          ),

                                          CircleAvatar(
                                            radius: 15,
                                            child: Icon(Icons.person, size: 16),
                                          ),

                                          CircleAvatar(
                                            radius: 15,
                                            child: Icon(Icons.person, size: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // ============================================================
                          // DYNAMIC HABIT CARDS
                          // ============================================================
                          ...habits.map((habit) {
                            return Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 16),
                              padding: const EdgeInsets.all(12),

                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.black12),
                              ),

                              child: Row(
                                children: [
                                  // ==================================================
                                  // HABIT ICON
                                  // ==================================================

                                  Container(
                                    width: 52,
                                    height: 52,

                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    child: Center(
                                      child: Text(
                                        habit.icon,
                                        style: const TextStyle(fontSize: 26),
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  // ==================================================
                                  // HABIT DETAILS
                                  // ==================================================
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          habit.name,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        const SizedBox(height: 6),

                                        Row(
                                          children: [
                                            const Text(
                                              '🔥',
                                              style: TextStyle(fontSize: 16),
                                            ),

                                            const SizedBox(width: 5),

                                            Text(
                                              '${habit.streak} days',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                  // ==================================================
                                  // CHECKBOX
                                  // ==================================================
                                  Checkbox(
                                    value: habit.completed,

                                    onChanged: (value) {
                                      setState(() {
                                        habit.completed = value ?? false;
                                      });
                                    },

                                    shape: const CircleBorder(),

                                    fillColor:
                                        WidgetStateProperty.resolveWith<Color>((
                                          states,
                                        ) {
                                          if (states.contains(
                                            WidgetState.selected,
                                          )) {
                                            return const Color(0xFFFF806B);
                                          }

                                          return Colors.white;
                                        }),
                                  ),
                                ],
                              ),
                            );
                          }),

                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),

                  // ==================================================
                  // BOTTOM NAVIGATION
                  // This stays fixed while the content scrolls
                  // ==================================================
                  Container(
                    height: 72,

                    margin: const EdgeInsets.only(bottom: 8),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          spreadRadius: 1,
                          color: Colors.black12,
                        ),
                      ],
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // ==================================================
                        // HOME BUTTON
                        // ==================================================

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_rounded,
                              color: Color(0xFFFF806B),
                              size: 22,
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFF806B),
                              ),
                            ),
                          ],
                        ),

                        // ==================================================
                        // CALENDAR BUTTON
                        // ==================================================
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.grey,
                              size: 22,
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Calendar',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        // ==================================================
                        // PLUS BUTTON
                        // ==================================================
                        Container(
                          width: 52,
                          height: 52,

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFF806B),
                          ),

                          child: Icon(Icons.add, color: Colors.white, size: 30),
                        ),

                        // ==================================================
                        // ANALYTICS BUTTON
                        // ==================================================
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.analytics_outlined,
                              color: Colors.grey,
                              size: 22,
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Analytics',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        // ==================================================
                        // PROFILE BUTTON
                        // ==================================================
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.grey,
                              size: 22,
                            ),

                            SizedBox(height: 3),

                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
