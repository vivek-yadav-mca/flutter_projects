import 'package:flutter/material.dart';
import 'package:todoey_list_challenge/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoey_list_challenge/tasklist.dart';

void main() {
  runApp(TodoeyApp());
}

class TodoeyApp extends StatelessWidget {
  TodoeyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskList>(
      create: (BuildContext context) => TaskList(taskName: ''),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
