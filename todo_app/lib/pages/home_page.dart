import 'package:flutter/material.dart';

import '../config/todo_list.dart';
import '../data/todo_model.dart';
import 'completed_page.dart';
import 'tasks_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();

  ///[currentPageIndex] indicates current page index in [BottomNavigationBar] class
  int currentPageIndex = 0;

  /// define a [TodoModel] list for maintaining state
  final List<TodoModel> todoList = TodoList.todos;
  final List<TodoModel> doneTodoList = [];

  /// [Widget] list to show based on selected [currentPageIndex]
  void addTodo(TodoModel todo) {
    setState(() {
      todoList.add(todo);
    });
  }

  void doneTodo(TodoModel todo) {
    setState(() {
      todoList.remove(todo);
      doneTodoList.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        centerTitle: true,
        actions: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.amber.shade100,
            ),
            icon: const Icon(Icons.bubble_chart_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: PageView(
        /// [PageView] is exactly [ListView] or [GridView] but for showing pages, we use [PageView] with [PageViewController]
        /// Tutorial: https://api.flutter.dev/flutter/widgets/PageView-class.html
        ///
        controller: pageController,
        onPageChanged: (int index) {
          /// update [currentPageIndex] when page is scrolled
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          TasksPage(
            todoList: todoList,
            onTodoDone: doneTodo,
          ), // index 0
          CompletedPage(), // index 1
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () async {
          final returnVal = await Navigator.pushNamed(context, '/new_task');

          /// check if [returnVal] is [null]
          /// if not [null], check if it is of Type [TodoModel]
          /// if [returnVal] is not null and it is of Type [TodoModel]
          /// add it to the [TodoList]
          ///
          if (returnVal != null) {
            addTodo(returnVal as TodoModel);
          }
        },
        child: const Icon(
          Icons.add_task_rounded,
          color: Colors.orange,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          pageController.animateToPage(currentPageIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        },
        elevation: 0.0,
        fixedColor: Colors.orange,
        currentIndex: currentPageIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.sticky_note_2_rounded),
            icon: Icon(Icons.sticky_note_2_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.task_rounded),
            icon: Icon(Icons.task_outlined),
            label: 'Completed',
          ),
        ],
      ),
    );
  }
}
