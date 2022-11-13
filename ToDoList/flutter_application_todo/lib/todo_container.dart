import 'package:flutter/material.dart';
import 'buttons.dart';

class ToDoContainer extends StatelessWidget {
  ToDoContainer(
      {super.key,
      required this.task,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  final String task;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.greenAccent, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Colors.deepPurpleAccent,
          ),
          Text(
            task,
            style: TextStyle(
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          Spacer(),
          IconButton(
              onPressed: deleteFunction,
              iconSize: 20,
              icon: const Icon(Icons.delete)),
        ],
      ),
    );
  }
}
