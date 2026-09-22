# Habit Tracker - Day 3

## Overview
Day 3 focuses on refining the code readibility and make the Habit Tracker UI to better match the reference design.
## What I Changed
### Code Architecture (Main Focus Today)
- **Broke down 889-line monolithic file** from Day 2 into small, clean, modular widget files
- Created a dedicated `lib/widgets/` folder with one responsibility per file:
  - `header_section.dart` — App bar with slider icon, date, title, and profile avatar
  - `daily_progress_card.dart` — Peach progress card with dynamic count and gradient ring
  - `deadline_card.dart` — Deadline info card
  - `people_card.dart` — Overlapping avatar group card
  - `habit_card.dart` — Individual habit row with animated toggle
  - `custom_bottom_nav_bar.dart` — Floating rounded bottom navigation bar
- `home_page.dart` is now a clean **~130 line** orchestrator file that reads like an outline:

###Project Structure
lib/
├── main.dart
├── models/
│   └── habit.dart
├── screens/
│   └── home_page.dart
└── widgets/
    ├── header_section.dart
    ├── daily_progress_card.dart
    ├── deadline_card.dart
    ├── people_card.dart
    ├── habit_card.dart
    └── custom_bottom_nav_bar.dart
## Run
```bash
flutter run -d chrome