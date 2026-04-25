import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavFeatureScreen extends StatelessWidget {
  const MainNavFeatureScreen({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Team"),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Task Board",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],

        type: .fixed,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(index),
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
      body: navigationShell,
    );
  }
}
