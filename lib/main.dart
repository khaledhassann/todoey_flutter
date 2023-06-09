import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/cn_tasks.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CNTasks(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

