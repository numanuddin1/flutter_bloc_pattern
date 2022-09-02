import 'package:flutter/material.dart';

import '../models/task.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {Key? key, required this.pendingTask, required this.completedTask})
      : super(key: key);

  final List<Task> pendingTask, completedTask;

  int total = 0;

  double getPer() {
    total = (pendingTask.length + completedTask.length);
    return completedTask.length / total;
  }

  @override
  Widget build(BuildContext context) {
    print(getPer());
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF041955),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${pendingTask.length} Pending'),
            Text(
              'Personal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${completedTask.length} Completed',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            LinearProgressIndicator(
              value: total > 0 ? getPer() : 0,
              backgroundColor: Colors.white54,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffdb09ee)),
            )
          ],
        ),
      ),
    );
  }
}
