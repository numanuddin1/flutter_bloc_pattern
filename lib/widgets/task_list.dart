import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/task_exports.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: taskList.length, itemBuilder: (context, index) {
      return ListTile(
        onLongPress: () => context.read<TaskBloc>().add(DeleteTaskEvent(task: taskList[index])),
        title: Text(taskList[index].title),
        trailing: Checkbox(value: taskList[index].isDone, onChanged: (bool? value){
          context.read<TaskBloc>().add(UpdateTaskEvent(task: taskList[index]));
        }),
      );
    });
  }
}
