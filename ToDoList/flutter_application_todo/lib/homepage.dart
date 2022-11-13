import 'package:flutter/material.dart';
import 'todo_container.dart';
import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ["Task 1", false],
  ];

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void cancelSave() {
    Navigator.of(context).pop();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () {
            cancelSave();
          },
          onSave: () {
            saveNewTask();
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 205, 203),
      appBar: AppBar(
        title: const Text("My to do list"),
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 202, 205, 203),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.add,
          color: Colors.deepPurple,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoContainer(
            task: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: () {
              deleteTask(index);
            },
          );
        },
      ),
    );
  }
}
