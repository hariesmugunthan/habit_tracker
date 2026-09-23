# Habit Tracker — Day 5

## Overview

Day 5 focused on continuing the **New Habit screen** by adding and refining the remaining UI elements based on the reference design.

The screen was made scrollable to accommodate the complete form while keeping the bottom navigation bar fixed.

---

## Day 5 Changes

### 1. Choose Duration Section

Added the duration selection UI with:

- Daily
- Weekdays
- Weekends
- Custom

The selected option includes a vertical orange/coral gradient matching the reference design.

### 2. Reminder Time Section

Added the Reminder Time UI containing:

- Reminder Time label
- Notification/bell icon
- Time display
- Clock icon
- Rounded white container

### 3. Add Habit Button

Added the **Add Habit** button below the Reminder Time section.

- Matched the width and height of the bottom navigation bar.
- Applied the same orange/coral gradient used in the selected duration button.
- Added rounded corners to match the reference UI.

### 4. Scrollable New Habit Screen

The New Habit page content is now placed inside a `SingleChildScrollView`.

This allows all UI elements to remain accessible within the fixed 360 × 800 mobile frame.

### 5. Bottom Navigation

Added the existing `CustomBottomNavBar` to the New Habit screen.

The navigation bar remains fixed at the bottom while the New Habit content scrolls.

---

## New Habit Page Structure

```text
NewHabitPage
│
├── NewHabitHeader
├── HabitNameSection
├── HabitIconSection
├── ChooseDurationIcon
├── ReminderTime
├── AddHabitButton
└── CustomBottomNavBar

### Project Structure
day5/
└── lib/
    ├── main.dart
    │
    ├── models/
    │   └── habit.dart
    │
    ├── screens/
    │   ├── home_page.dart
    │   └── new_habit_page.dart
    │
    └── widgets/
        ├── custom_bottom_nav_bar.dart
        ├── daily_progress_card.dart
        ├── deadline_card.dart
        ├── people_card.dart
        ├── habit_card.dart
        ├── header_section.dart
        ├── new_habit_header.dart
        ├── habit_name_section.dart
        ├── habit_icon_section.dart
        ├── choose_duration_icon.dart
        ├── reminder_time.dart
        └── add_habit_button.dart