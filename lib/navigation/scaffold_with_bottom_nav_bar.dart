import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          // NavigationDestination(icon: Icon(Icons.face), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.folder), label: 'Reports'),
          // NavigationDestination(icon: Icon(Icons.person), label: 'Exercises'),
          NavigationDestination(
              icon: Icon(Icons.settings), label: 'Preferences')
        ],
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          navigationShell.goBranch(index);
        },
      ),
    );
  }
}
