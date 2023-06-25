import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class CNTasks extends ChangeNotifier{
  // ignore: prefer_final_fields
  List<Task> _tasks = [
    Task(name: "Get a 5th place in a judo tournament"),
    Task(name: "Sign autographs"),
    Task(name: "Become a millionaire"),
  ];

  void addTask(String taskTitle){
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get taskCount{
    return tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

}