// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_pattern/models/task.dart';
import 'package:flutter_bloc_pattern/screens/my_drawer.dart';
import 'package:flutter_bloc_pattern/services/app_theme.dart';
import 'package:flutter_bloc_pattern/widgets/task_list.dart';

import '../blocs/task_bloc/task_state.dart';
import '../blocs/task_exports.dart';
import '../widgets/category_card.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  static const id = 'task_screen';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
  Color color = Color(0xFF3450a1);

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: AddTaskScreen(),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: color,
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.search),
              )
            ],
          ),
          backgroundColor: color,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('Hello, Numan!',  style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.w500)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: Text('CATEGORIES',  style: TextStyle(color: Colors.white70),),
              ),
              Container(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: CategoryCard(task: state.allTasks,),
                ),
              ),
              SizedBox(height: 18,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
                child: Text('TODAY\'S TASKS', style: TextStyle(color: Colors.white70),),
              ),
              Expanded(child: TaskList(taskList: state.allTasks))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            backgroundColor: Color(0xffdb09ee),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 28,
            ),
          ),
          drawer: MyDrawer(),
        );
      },
    );
  }
}

