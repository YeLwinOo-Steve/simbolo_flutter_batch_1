import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.todo,
    required this.onDone,
  });
  final TodoModel todo;
  final void Function() onDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.orange.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(todo.description),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    todo.datetime,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  Text(
                    '10:00 AM',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                ),
                iconSize: 14,
                onPressed: () {
                  /// ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ Assignment 1
                  /// TODO: edit function here
                  /// Edit with dialog or route to edit page
                  /// TODO: implement delete function yourself
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.green.shade100,
                ),
                onPressed: onDone,
                icon: const Icon(
                  Icons.task_alt,
                  color: Colors.green,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
