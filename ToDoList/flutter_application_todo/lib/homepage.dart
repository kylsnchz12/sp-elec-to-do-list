import 'package:flutter/material.dart';
import 'todo_container.dart';
import 'dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [];

  final _controller = TextEditingController();
  int count = 0;

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
    count++;
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    count--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 202, 205, 203),
      appBar: AppBar(
        elevation: 0,
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
      body: Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(bottom: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'To do List',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            const SizedBox(height: 20),
            Text(
              ' $count tasks',
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
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
            )
          ],
        ),
      ),
    );
  }
}
