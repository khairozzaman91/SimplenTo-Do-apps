import 'package:flutter/material.dart';
import 'to_do_controller.dart';

class HomePageToDo extends StatefulWidget {
  const HomePageToDo({super.key});

  @override
  State<HomePageToDo> createState() => _HomePageToDoState();
}

class _HomePageToDoState extends State<HomePageToDo> {
  final toDoController = ToDoController();

  void showTaskBottomSheet({int? index}) {

    if (index != null) {
      toDoController.titleTextEditingController.text =
          toDoController.taskList[index].taskName;
      toDoController.detailsTextEditingController.text =
          toDoController.taskList[index].taskDetails;
    } else {
      toDoController.clearInput();
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  index == null ? "Add New Task" : "Update Task",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: toDoController.titleTextEditingController,
                  decoration:
                  InputDecoration(labelText: 'Task Title', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: toDoController.detailsTextEditingController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: 'Task Details', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.save),
                      label: Text(index == null ? "Save Task" : "Update Task"),
                      onPressed: () {
                        setState(() {
                          if (index == null) {
                            toDoController.addNewTask(
                              toDoController.titleTextEditingController.text,
                              toDoController.detailsTextEditingController.text,
                            );
                          } else {
                            toDoController.updateTask(
                              index,
                              toDoController.titleTextEditingController.text,
                              toDoController.detailsTextEditingController.text,
                            );
                          }
                          toDoController.clearInput();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App'),
        backgroundColor: Colors.blueGrey.shade300,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: toDoController.taskList.length,
        itemBuilder: (context, index) {
          final task = toDoController.taskList[index];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ExpansionTile(
              leading: Icon(
                task.isComplete ? Icons.check_box : Icons.check_box_outline_blank,
                color: task.isComplete ? Colors.green : null,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      task.taskName,
                      style: TextStyle(
                        decoration: task.isComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      // Mark complete / Undo button
                      IconButton(
                        icon: Icon(
                          task.isComplete ? Icons.undo : Icons.done,
                          color: task.isComplete ? Colors.orange : Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            task.isComplete = !task.isComplete;
                          });
                        },
                      ),
                      // Edit button
                      IconButton(
                        icon: Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => showTaskBottomSheet(index: index),
                      ),
                      // Delete button
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            toDoController.taskList.removeAt(index);
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      task.taskDetails,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),

              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showTaskBottomSheet(),
        child: Icon(Icons.add),
      ),
    );
  }
}
