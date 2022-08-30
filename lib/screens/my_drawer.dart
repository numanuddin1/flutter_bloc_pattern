import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/task_exports.dart';
import 'package:flutter_bloc_pattern/screens/recycle_bin.dart';
import 'package:flutter_bloc_pattern/screens/tasks_screen.dart';
import 'package:flutter_bloc_pattern/services/app_router.dart';

import '../blocs/task_bloc/task_state.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              color: Colors.grey,
              child: Text(
                'Task Drawer',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline5,
              ),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(TasksScreen.id),
              child: ListTile(
                leading: Icon(Icons.task),
                title: Text('My Tasks'),
                trailing: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Text('${state.allTasks.length}');
                  },
                ),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacementNamed(RecycleBin.id),
              child: ListTile(
                leading: Icon(Icons.delete),
                title: Text('Bin'),
                trailing: BlocBuilder<TaskBloc, TaskState>(
                  builder: (context, state) {
                    return Text('${state.removedTasks.length}');
                  },
                ),
              ),
            ),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(value: state.switchValue, onChanged: (newValue) {
                 newValue ? context.read<SwitchBloc>().add(SwitchOnEvent())
                 : context.read<SwitchBloc>().add(SwitchOffEvent());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
