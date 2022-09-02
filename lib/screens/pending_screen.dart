// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_pattern/widgets/task_list.dart';

import '../blocs/task_bloc/task_state.dart';
import '../blocs/task_exports.dart';
import '../widgets/category_card.dart';

class PendingTasksScreen extends StatelessWidget {
  PendingTasksScreen({Key? key}) : super(key: key);

  static const id = 'task_screen';

  Color color = Color(0xFF3450a1);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: color,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: Text('Hello, Numan!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: Text(
                  'CATEGORIES',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Container(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CategoryCard(
                    pendingTask: state.pendingTasks,
                    completedTask: state.completedTasks,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: Text(
                  'TODAY\'S TASKS',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              Expanded(child: TaskList(taskList: state.pendingTasks))
            ],
          ),
        );
      },
    );
  }
}
