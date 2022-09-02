// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/screens/pending_screen.dart';

import 'add_task_screen.dart';
import 'completed_task_screen.dart';
import 'favorite_task_screen.dart';
import 'my_drawer.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key}) : super(key: key);

  static const id = 'tab_screen';

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  final List<Map<String, dynamic>> _pages = [
    {'pageName': PendingTasksScreen(), 'title': ''},
    {'pageName': CompletedTasksScreen(), 'title': 'Completed Task'},
    {'pageName': FavoriteTasksScreen(), 'title': 'Favorites'},
  ];

  int currentIndex = 0;


  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery
                    .of(context)
                    .viewInsets
                    .bottom,
              ),
              child: AddTaskScreen(),
            ),
          );
        });
  }

  Color color = Color(0xFF3450a1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: color,
        title: Text(_pages[currentIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _pages[currentIndex]['pageName'],
      floatingActionButton: currentIndex == 0 ? FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        backgroundColor: Color(0xffdb09ee),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
      ): null,
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF041955),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Color(0xFF00B2FF),
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle), label: 'Pending Task'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
    );
  }
}
