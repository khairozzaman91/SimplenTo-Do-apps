# Simple To-Do App (Flutter + Hive)

A simple Flutter To-Do application with add, update, delete, and task-completion features.  
This project is ideal for beginners learning CRUD operations and **local persistent storage using Hive**.

---

## Screenshots

### Home Page
<img src="https://github.com/user-attachments/assets/07d11ff2-0fe5-451c-877c-da5fb19fb1c0" width="250">

### Update Task Page
<img src="https://github.com/user-attachments/assets/8cb1720e-a72f-455c-bf3a-40b297504bde" width="250"/>

---

## Features

- 📝 Add New Task  
- ✏️ Edit Task  
- ❌ Delete Task  
- ✔️ Mark Task as Completed  
- 🔽 Expand to show Task Details  
- 💾 Persistent storage using **Hive** database  
- 🛠 Simple MVC-style code structure  

---

## Technology Stack

- **Flutter** ^3.10.3  
- **Hive** ^2.2.3 → Lightweight NoSQL DB for local storage  
- **Hive Flutter** ^1.1.0 → Hive integration for Flutter  
- **Path Provider** ^2.1.5 → Required by Hive to locate storage directory  

**Dev Dependencies (For Hive Code Generation):**  
- **hive_generator** ^2.0.0 → To generate Hive TypeAdapter  
- **build_runner** ^2.4.6 → To run code generation  

---

## Project Structure

```text
lib/
 ├── main.dart                 # Entry point, Hive initialization
 ├── to_do/
 │    ├── home_page_to_do.dart  # UI for displaying task list
 │    ├── to_do_controller.dart # Controller for task CRUD operations
 │    └── model/
 │         └── task_model.dart  # Hive model and adapter
How It Works
Hive Initialization
Hive is initialized in main.dart. TaskModelAdapter is registered, and the tasksBox is opened before the app starts.

CRUD Operations
ToDoController manages tasks:

addNewTask() → Add a task

updateTask() → Update a task

toggleComplete() → Mark task completed / undo

deleteTask() → Delete task (with undo option)

insertTask() → Re-insert deleted task

UI
HomePageToDo uses ListView.builder and ExpansionTile for each task.

Bottom sheet is used to add or update tasks.

Tasks have color coding based on completion status.

Persistence
All tasks are stored in Hive, so they remain saved even after app restart.

Getting Started
Clone the repository:

bash
Copy code
git clone https://github.com/khairozzaman91/SimplenTo-Do-apps.git
cd SimplenTo-Do-apps
Install dependencies:

bash
Copy code
flutter pub get
Generate Hive TypeAdapters:

bash
Copy code
flutter pub run build_runner build --delete-conflicting-outputs
This will create the task_model.g.dart file required by Hive.

Run the app:

bash
Copy code
flutter run
Notes
Bottom Sheet: Dynamically used for adding/updating tasks.

Undo Delete: Deleted tasks can be restored using the SnackBar action.

Completion: Completed tasks are shown with a different color and strikethrough text.

Hive Adapter: Make sure task_model.g.dart is generated before running the app.
