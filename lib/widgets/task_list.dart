import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/task_exports.dart';
import 'package:flutter_bloc_pattern/widgets/list_item.dart';
import 'package:flutter_bloc_pattern/widgets/task_tile.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return ListItem(task: task);
        });
  }
}
