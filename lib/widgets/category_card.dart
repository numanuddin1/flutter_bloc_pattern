import 'package:flutter/material.dart';

import '../models/task.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.task}) : super(key: key);

  final List<Task> task;

  @override
  Widget build(BuildContext context) {
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
            Text('${task.length} tasks'),
            Text('Personal', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
            LinearProgressIndicator(
              value: 0.6,
              backgroundColor: Colors.white54,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xffdb09ee)) ,
            )
          ],
        ),
      ),
    );
  }
}
