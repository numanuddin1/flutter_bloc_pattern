import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/screens/recycle_bin.dart';
import 'package:flutter_bloc_pattern/screens/pending_screen.dart';
import 'package:flutter_bloc_pattern/screens/tabs_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(builder: (_) => RecycleBin());
      case TabScreen.id:
        return MaterialPageRoute(builder: (_) => TabScreen());

    }
  }
}
