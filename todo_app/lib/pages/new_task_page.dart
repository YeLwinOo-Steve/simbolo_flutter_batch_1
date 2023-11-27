import 'package:flutter/material.dart';
import 'package:todo_app/config/todo_list.dart';
import 'package:todo_app/data/todo_model.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('new task'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final newTodo = TodoModel('one thing', 'somthing', 'sometime');
          Navigator.pop(context, newTodo);
        },
        icon: Icon(Icons.check),
        label: Text("Save"),
      ),
    );
  }
}
