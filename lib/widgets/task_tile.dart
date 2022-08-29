import 'package:flutter/material.dart';

import '../blocs/task_exports.dart';
import '../models/task.dart';


class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => context
          .read<TaskBloc>()
          .add(DeleteTaskEvent(task: task)),
      title: Text(task.title, style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : null),),
      trailing: Checkbox(
          value: task.isDone,
          onChanged: (bool? value) {
            context
                .read<TaskBloc>()
                .add(UpdateTaskEvent(task: task));
          }),
    );
  }
}
