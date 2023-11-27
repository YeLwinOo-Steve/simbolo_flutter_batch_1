import 'package:flutter/material.dart';

import '../config/todo_list.dart';
import '../data/todo_model.dart';
import '../widgets/task_card.dart';

class TasksPage extends StatelessWidget {
  TasksPage({
    super.key,
    required this.todoList,
    required this.onTodoDone,
  });
  final List<TodoModel> todoList;
  final Function(TodoModel) onTodoDone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            todoList.length,
            (index) {
              return TaskCard(
                todo: todoList[index],
                onDone: () => onTodoDone(todoList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
