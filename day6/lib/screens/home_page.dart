import 'package:flutter/material.dart';

// ----------------------------------------------------------------------------
// DATA MODEL & MODULAR WIDGET IMPORTS
// ----------------------------------------------------------------------------
import '../models/habit.dart';
import '../widgets/header_section.dart';
import '../widgets/daily_progress_card.dart';
import '../widgets/deadline_card.dart';
import '../widgets/people_card.dart';
import '../widgets/habit_card.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import 'new_habit_page.dart';

// ============================================================================
// HOME PAGE (STATEFUL WIDGET)
// ============================================================================
// Holds application state:
// - List of active habits
// - Tab selection state
// ============================================================================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ============================================================================
// HOME PAGE STATE (BUSINESS LOGIC & UI BUILDER)
// ============================================================================

class _MyHomePageState extends State<MyHomePage> {
  // --------------------------------------------------------------------------
  // 1. HABIT DATA LIST (MOCK DATA MATCHING MOCKUP)
  // --------------------------------------------------------------------------
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

  int _selectedTabIndex = 0;

  // --------------------------------------------------------------------------
  // 2. COMPUTED PROPERTIES (BUSINESS LOGIC)
  // --------------------------------------------------------------------------
  int get completedHabitsCount {
    return habits.where((habit) => habit.completed).length;
  }

  // --------------------------------------------------------------------------
  // 3. EVENT HANDLERS
  // --------------------------------------------------------------------------
  void _toggleHabit(int index) {
    setState(() {
      habits[index].completed = !habits[index].completed;
    });
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  // ==========================================================================
  // 4. MAIN BUILD METHOD
  // ==========================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Soft background for Chrome demo screen
      backgroundColor: const Color(0xFFEFEFEF),

      body: Center(
        child: Container(
          // Fixed mobile frame dimensions for browser demo (360 x 800)
          width: 360,
          height: 800,
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F8), // Warm off-white mobile canvas
            borderRadius: BorderRadius.circular(28),
            boxShadow: const [
              BoxShadow(
                blurRadius: 24,
                spreadRadius: 2,
                color: Color(0x1F000000),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,

          child: SafeArea(
            child: Stack(
              children: [
                // ------------------------------------------------------------
                // [LAYER 1] SCROLLABLE CONTENT
                // ------------------------------------------------------------
                Positioned.fill(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- 1. HEADER SECTION ---
                        const HeaderSection(),

                        // --- 2. DAILY PROGRESS CARD ---
                        DailyProgressCard(
                          completedHabits: completedHabitsCount,
                          totalHabits: habits.length,
                          bestStreak: 15,
                        ),

                        const SizedBox(height: 16),

                        // --- 3. DEADLINE & PEOPLE ROW ---
                        const Row(
                          children: [
                            Expanded(child: DeadlineCard(dateText: '12 April')),
                            SizedBox(width: 12),
                            Expanded(child: PeopleCard()),
                          ],
                        ),

                        const SizedBox(height: 18),

                        // --- 4. DYNAMIC HABIT LIST ---
                        ...List.generate(habits.length, (index) {
                          final habit = habits[index];
                          return HabitCard(
                            habit: habit,
                            onToggle: () => _toggleHabit(index),
                          );
                        }),
                      ],
                    ),
                  ),
                ),

                // ------------------------------------------------------------
                // [LAYER 2] FLOATING BOTTOM NAVIGATION BAR
                // ------------------------------------------------------------
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 4,
                  child: CustomBottomNavBar(
                    currentIndex: _selectedTabIndex,
                    onTabSelected: _onTabSelected,
                    onAddPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NewHabitPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
