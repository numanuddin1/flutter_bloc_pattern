import 'package:flutter/material.dart';

import '../blocs/task_bloc/task_state.dart';
import '../blocs/task_exports.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'my_drawer.dart';

class CompletedTasksScreen extends StatelessWidget {
   CompletedTasksScreen({Key? key}) : super(key: key);

  Color color = Color(0xFF3450a1);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.completedTasks;
        return Scaffold(
          backgroundColor: color,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Chip(
                  label: Text(
                    '${tasksList.length} Tasks',
                  ),
                ),
              ),
              Expanded(child: TaskList(taskList: tasksList))
            ],
          ),

          drawer: MyDrawer(),
        );
      },
    );
  }
}
