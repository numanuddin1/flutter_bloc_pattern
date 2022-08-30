import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/blocs/task_exports.dart';
import 'package:flutter_bloc_pattern/screens/recycle_bin.dart';
import 'package:flutter_bloc_pattern/screens/tasks_screen.dart';
import 'package:flutter_bloc_pattern/services/app_router.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool switchValue = false;

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
              onTap: () => Navigator.of(context).pushReplacementNamed(TasksScreen.id),
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
              onTap: () => Navigator.of(context).pushReplacementNamed(RecycleBin.id),
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
            Switch(value: switchValue, onChanged: (newValue){
              setState(() {
                switchValue = newValue;
              });
            })
          ],
        ),
      ),
    );
  }
}
