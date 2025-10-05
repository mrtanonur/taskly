Taskly

Taskly is a cross-platform Flutter to-do app that allows users to manage tasks efficiently. The app supports multiple languages, customizable themes, and offline storage using Hive. It is designed to work seamlessly on both Android and iOS.

Features

	•	Task Management
  
	•	Add, update, and delete tasks.
  
	•	Mark tasks as done or pending.
  
	•	View tasks separated by status (todos/done).
  
	•	Theming
  
	•	Supports Light, Dark, and System themes.
  
	•	Theme changes are persisted locally using Hive.
  
	•	Localization
  
	•	Supports multiple languages (currently English and Turkish).
  
	•	Easy to extend for additional languages.
  
	•	Localized UI texts using AppLocalizations.
  
	•	Persistent Storage
  
	•	Uses Hive for local data storage.
  
	•	Tasks and app settings (theme, language) are saved locally.
  
	•	Platform-specific UI
  
	•	Android: BottomNavigationBar and Material design.
  
	•	iOS: CupertinoSlidingSegmentedControl and CupertinoTabBar.


  Architecture & Code Structure
  
	•	Models
  
	•	TodoModel: Represents a single to-do task. Supports copyWith for immutability.
  
	•	Uses Hive annotations for persistence.
  
	•	Data Sources
  
	•	MainLocalDataSource: Stores app settings like theme and language.
  
	•	TodoLocalDataSource: Stores tasks and provides CRUD operations.
  
	•	State Management
  
	•	MainProvider: Handles theme, language, and bottom navigation state.
  
	•	TodoProvider: Handles task operations (add, update, delete, toggle done).
  
	•	UI
  
	•	HomePage: Main entry point with navigation.
  
	•	TasksPage: Displays tasks in tabs or segmented control.
  
	•	SettingsPage: Configure app theme and language.
  
	•	TasklyModalSheet: Bottom sheet for adding or updating tasks.
  
	•	TodoTile: Reusable widget for displaying a task with checkbox.
  
	•	Extensions
  
	•	ThemeExtension and TodoOperationExtension for localized text representations of enums.

  Dependencies
  
	•	Flutter
  
	•	Hive – lightweight local database
  
	•	Provider – state management
  
	•	UUID – unique ID generation for tasks
  
	•	flutter_localizations – for localization

To Clone the repository

git clone https://github.com/mrtanonur/taskly.git

cd taskly

Install dependencies

flutter pub get

Run the app

flutter run


  lib/
  
├─ main.dart

├─ models/

│  └─ todo_model.dart # Todo model with Hive annotations

├─ data/

│  ├─ main_local_data_source.dart

│  └─ todo_local_data_source.dart

├─ providers/

│  ├─ main_provider.dart

│  └─ todo_provider.dart

├─ ui/

│  ├─ pages/

│  │  ├─ home_page.dart

│  │  ├─ tasks_page.dart

│  │  ├─ settings_page.dart

│  │  ├─ theme_page.dart

│  │  └─ language_page.dart

│  ├─ widgets/

│  │  ├─ todo_tile.dart

│  │  ├─ taskly_modal_sheet.dart

│  │  └─ taskly_textformfield.dart

└─ l10n/

   └─ app_localizations.dart


  
