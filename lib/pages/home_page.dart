import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/pages/settings_page.dart';
import 'package:taskly/pages/tasks_page.dart';
import 'package:taskly/providers/main_provider.dart';
import 'package:taskly/widgets/taskly_bottom_navigation_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> pages = [
    const TasksPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[context.watch<MainProvider>().navigationIndex],
        bottomNavigationBar: const TasklyBottomNavigationBar());
  }
}
