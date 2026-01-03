# 📝 Simple To-Do App (Flutter + Hive)

[![Flutter](https://img.shields.io/badge/Flutter-3.10.3-blue?logo=flutter)](https://flutter.dev/)
[![Hive](https://img.shields.io/badge/Hive-2.2.3-orange?logo=database)](https://pub.dev/packages/hive)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A simple **Flutter To-Do application** with add, update, delete, and task-completion features.  
This project demonstrates **CRUD operations** and **local persistent storage using Hive**. Ideal for beginners learning Flutter.

---

## 📸 Screenshots

### Home Page
![home](https://github.com/user-attachments/assets/b655f19d-6b4f-4288-9245-ec1897aea311)

### Update Task Page
![update task](https://github.com/user-attachments/assets/1da01929-31da-436f-b42c-aa888b7372cf)

### Add New Task
![new task](https://github.com/user-attachments/assets/6d1f75d0-39b3-48d7-a07d-9b10e86f685d)

---

## 🌟 Features

- 📝 Add New Task  
- ✏️ Edit Task  
- ❌ Delete Task  
- ✔️ Mark Task as Completed  
- 🔽 Expand to show Task Details  
- 💾 Persistent storage using **Hive**  
- 🛠 Simple MVC-style project structure  

---

## 🛠 Technology Stack

- **Flutter** ^3.10.3  
- **Hive** ^2.2.3 → Lightweight NoSQL DB for local storage  
- **Hive Flutter** ^1.1.0 → Hive integration for Flutter  
- **Path Provider** ^2.1.5 → Required by Hive for storage location  

**Dev Dependencies (Hive Code Generation):**  
- **hive_generator** ^2.0.0 → To generate Hive TypeAdapter  
- **build_runner** ^2.4.6 → Run code generation  

---

## 🗂 Project Structure

lib/
 ├── main.dart                     # Entry point, Hive initialization
 ├── to_do/
 │    ├── home_page_to_do.dart     # UI for displaying task list
 │    ├── to_do_controller.dart    # Controller for task CRUD operations
 │    └── model/
 │         └── task_model.dart     # Hive model and adapter
⚙ How It Works
Hive Initialization
Initialized in main.dart.

TaskModelAdapter is registered.

tasksBox is opened before the app starts.

CRUD Operations (ToDoController)
addNewTask() → Add a task

updateTask() → Update a task

toggleComplete() → Mark task completed / undo

deleteTask() → Delete task (with undo option)

insertTask() → Re-insert deleted task

UI
HomePageToDo uses ListView.builder and ExpansionTile for tasks.

Bottom sheet is used for adding/updating tasks.

Tasks have color coding based on completion status.

Persistence
All tasks are stored in Hive, so they remain saved even after app restart.

🚀 Getting Started
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
This will create the required task_model.g.dart file.

Run the app:
bash
Copy code
flutter run
📝 Notes
Bottom Sheet: Dynamically used for adding/updating tasks.

Undo Delete: Deleted tasks can be restored using the SnackBar action.

Completion: Completed tasks are shown with a different color and strikethrough text.

Hive Adapter: Make sure task_model.g.dart is generated before running the app.
