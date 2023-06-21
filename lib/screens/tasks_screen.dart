import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';

import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {

  //final viewInsets = EdgeInsets.fromWindowPadding(WidgetsBinding.instance.window.viewInsets,WidgetsBinding.instance.window.devicePixelRatio);


  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //TODO: Bottom drawer to add new task
            showModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),
              isScrollControlled: true,
            );
          },
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(
            Icons.add,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '12 tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*items
                    .map((text) => CheckboxListTile(
                          value: false,
                          onChanged: (val) {},
                          title: Text(text),
                        ))
                    .toList(),*/
