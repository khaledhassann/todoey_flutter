import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/cn_tasks.dart';

class TasksList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<CNTasks>(
      builder: (context, cnTasks, child){
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = cnTasks.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red,),
              onDismissed: (direction){
                cnTasks.deleteTask(index);
              },
              child: TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkBoxCallback: (checkBoxState) {
                  cnTasks.updateTask(task);
                },
              ),
            );
          },
          itemCount: cnTasks.taskCount,
        );
      },
    );
  }
}
