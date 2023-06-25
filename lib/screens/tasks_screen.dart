import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todoey_flutter/models/cn_tasks.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:flutter_keyboard_size/flutter_keyboard_size.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  bool _showFAB = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Consumer<CNTasks>(
      builder: (context, cnTasks, child){
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: AnimatedSlide(
            duration: duration,
            offset: _showFAB ? Offset.zero : const Offset(0, 2),
            child: AnimatedOpacity(
              duration: duration,
              opacity: _showFAB ? 1 : 0,
              child: FloatingActionButton(
                onPressed: () {
                  //TODO: Bottom drawer to add new task
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: AddTaskScreen((String? taskTitle){
                            cnTasks.addTask(taskTitle!);
                            Navigator.pop(context);
                        }),
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
            ),
          ),
          body: NotificationListener<UserScrollNotification>(
            onNotification: (notification){
              final ScrollDirection direction = notification.direction;
              setState(() {
                if (direction == ScrollDirection.reverse) {
                  _showFAB = false;
                } else if (direction == ScrollDirection.forward) {
                  _showFAB = true;
                }
              });
              return true;
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30.0,
                        child: Icon(
                          Icons.list,
                          size: 30.0,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Todoey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${cnTasks.taskCount} tasks',
                        style: const TextStyle(
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
      },
    );
  }
}
