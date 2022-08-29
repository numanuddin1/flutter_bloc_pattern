import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/screens/recycle_bin.dart';
import 'package:flutter_bloc_pattern/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TasksScreen.id:
        return MaterialPageRoute(builder: (_) => TasksScreen());

    }
  }
}
