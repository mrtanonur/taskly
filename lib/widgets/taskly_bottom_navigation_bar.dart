import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/providers/main_provider.dart';

class TasklyBottomNavigationBar extends StatefulWidget {
  const TasklyBottomNavigationBar({super.key});

  @override
  State<TasklyBottomNavigationBar> createState() =>
      _TasklyBottomNavigationBarState();
}

class _TasklyBottomNavigationBarState extends State<TasklyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomNavigationBar(
        currentIndex: context.watch<MainProvider>().navigationIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.check),
              label: AppLocalizations.of(context)!.tasks),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings)
        ],
        onTap: (index) {
          context.read<MainProvider>().changeNavigationIndex(index);
        },
      );
    } else {
      return CupertinoTabBar(
        currentIndex: context.watch<MainProvider>().navigationIndex,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.check),
              label: AppLocalizations.of(context)!.tasks),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings)
        ],
        onTap: (index) {
          context.read<MainProvider>().changeNavigationIndex(index);
        },
      );
    }
  }
}
