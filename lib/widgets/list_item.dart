import 'package:flutter/material.dart';

import '../blocs/task_exports.dart';
import '../models/task.dart';


class ListItem extends StatelessWidget {
  const ListItem({Key? key,  required this.task}) : super(key: key);

  final Task task;

  _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TaskBloc>().add(DeleteTaskEvent(task: task))
        : context.read<TaskBloc>().add(RemovedTaskEvent(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
     onLongPress: () =>
        _removeOrDeleteTask(context, task),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: double.infinity,
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFF041955),

        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    value: task.isDone,
                    activeColor: Color(0xffdb09ee),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        width: 8,
                      )
                    ),
                    checkColor: Colors.white,
                    onChanged: task.isDeleted == false? (bool? value) {
                      context.read<TaskBloc>().add(UpdateTaskEvent(task: task));
                    } : null),
              ),
              SizedBox(width: 10,),
              Text(task.title, style: TextStyle(color: Colors.white, decoration: task.isDone! ? TextDecoration.lineThrough : null),)
            ],
          ),
        ),

      ),
    );
  }
}
