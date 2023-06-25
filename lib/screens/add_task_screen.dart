import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {

  final Function(String?) addTaskCallback;
  AddTaskScreen(this.addTaskCallback);

  @override
  Widget build(BuildContext context) {

    String? taskName;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(),
              onChanged: (newTask){
                taskName = newTask;
              },
            ),
            const SizedBox(height: 20.0,),
            TextButton(
              onPressed: (){
                addTaskCallback(taskName);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>
                  (Colors.lightBlueAccent),
              ),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}