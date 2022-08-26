import 'package:flutter/material.dart';

import '../blocs/task_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({
    Key? key,
  }) : super(key: key);

  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 18,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
                label: Text('Title'), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(title: titleController.text);
                    context
                        .read<TaskBloc>()
                        .add(AddTaskEvent(task: task));
                    Navigator.pop(context);
                  },
                  child: Text('Add'))
            ],
          )
        ],
      ),
    );
  }
}
