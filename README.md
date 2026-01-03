# 📝 Simple To-Do App (Flutter + Hive)

[![Flutter](https://img.shields.io/badge/Flutter-3.10.3-blue?logo=flutter)](https://flutter.dev/)
[![Hive](https://img.shields.io/badge/Hive-2.2.3-orange?logo=database)](https://pub.dev/packages/hive)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A simple **Flutter To-Do application** with add, update, delete, and task-completion features.  
This project demonstrates **CRUD operations** and **local persistent storage using Hive**. Ideal for beginners learning Flutter.

---

## 📸 Screenshots

### Home Page
<img src="https://github.com/user-attachments/assets/b655f19d-6b4f-4288-9245-ec1897aea311" width="300">

### Update Task Page
<img src="https://github.com/user-attachments/assets/1da01929-31da-436f-b42c-aa888b7372cf" width="300">

### Add New Task
<img src="https://github.com/user-attachments/assets/6d1f75d0-39b3-48d7-a07d-9b10e86f685d" width="300">


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
---

## ⚙ How It Works

### Hive Initialization
- Hive is initialized in `main.dart`.
- `TaskModelAdapter` is registered.
- `tasksBox` is opened before the app starts.

### CRUD Operations (ToDoController)
- `addNewTask()` → Add a new task
- `updateTask()` → Update an existing task
- `toggleComplete()` → Mark task as completed or undo
- `deleteTask()` → Delete task (with undo option)
- `insertTask()` → Re-insert a deleted task

### UI
- `HomePageToDo` uses `ListView.builder` and `ExpansionTile` for tasks.
- Bottom sheet is used for adding/updating tasks.
- Tasks have color coding based on completion status.

### Persistence
- All tasks are stored in Hive, so they remain saved even after app restart.

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/khairozzaman91/SimplenTo-Do-apps.git
cd SimplenTo-Do-apps

## 🗂 Project Structure

```text
lib/
 ├── main.dart                     # Entry point, Hive initialization
 ├── to_do/
 │    ├── home_page_to_do.dart     # UI for displaying task list
 │    ├── to_do_controller.dart    # Controller for task CRUD operations
 │    └── model/
 │         └── task_model.dart     # Hive model and adapter
