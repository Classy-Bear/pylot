import 'package:flutter/material.dart';

class HomeNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  HomeNavigationBar({this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text("Quizzes"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flare),
          title: Text("Planets"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text("Settings"),
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
