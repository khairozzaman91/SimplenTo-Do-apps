import 'package:flutter/material.dart';
import 'model/taskModel.dart';

class ToDoController {
  TextEditingController titleTextEditingController = TextEditingController();
  TextEditingController detailsTextEditingController = TextEditingController();

  List<TaskModel> taskList = [
    TaskModel(
      taskName: 'Morning Routine',
      taskDetails: '1. Wake up early\n2. Brush teeth\n3. Exercise\n',
      isComplete: false,
    ),
    TaskModel(
      taskName: 'Work Tasks',
      taskDetails: '1. Check emails\n2. Attend meeting\n3. Submit report\n',
      isComplete: false,
    ),
    TaskModel(
      taskName: 'Grocery Shopping',
      taskDetails: '1. Buy milk\n2. Buy bread\n3. Buy vegetables\n',
      isComplete: false,
    ),
    TaskModel(
      taskName: 'Study Flutter',
      taskDetails: '1. Watch tutorial\n2. Practice code\n3. Build mini project\n',
      isComplete: false,
    ),
    TaskModel(
      taskName: 'Evening Routine',
      taskDetails: '1. Dinner\n2. Read book\n3. Prepare for tomorrow\n',
      isComplete: false,
    ),
  ];

  void addNewTask(String title, String details) {
    taskList.add(TaskModel(
      taskName: title,
      taskDetails: details,
      isComplete: false,
    ));
  }

  void updateTask(int index, String title, String details) {
    taskList[index].taskName = title;
    taskList[index].taskDetails = details;
  }

  void clearInput() {
    titleTextEditingController.clear();
    detailsTextEditingController.clear();
  }
}
