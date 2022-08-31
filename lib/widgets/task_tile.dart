import 'package:flutter/material.dart';

import '../blocs/task_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTaskEvent(task: task))
        : context.read<TaskBloc>().add(RemovedTaskEvent(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () =>
          _removeOrDeleteTask(context, task),
      title: Text(
        '${task.title}',
        style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: task.isDeleted == false? (bool? value) {
            context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
          } : null),

    );
  }
}
