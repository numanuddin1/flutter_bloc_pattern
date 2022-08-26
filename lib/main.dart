// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/screens/tasks_screen.dart';

import 'blocs/task_bloc.dart';
import 'blocs/task_exports.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Bloc',
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
