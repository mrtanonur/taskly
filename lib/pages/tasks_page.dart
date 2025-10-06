import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/providers/todo_provider.dart';
import 'package:taskly/widgets/add_todo_floating_action.dart';
import 'package:taskly/widgets/done_tab.dart';
import 'package:taskly/widgets/todos_tab.dart';

import '../utils/constants/constants.dart';

enum Todos {
  todos,
  done,
}

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  Todos selectedSegment = Todos.todos;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    context.read<TodoProvider>().getTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(text: AppLocalizations.of(context)!.todos),
      Tab(text: AppLocalizations.of(context)!.done),
    ];

    if (Platform.isAndroid) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          bottom: TabBar(controller: tabController, tabs: myTabs),
        ),
        body: TabBarView(controller: tabController, children: const [
          TodosTab(),
          DoneTab(),
        ]),
        floatingActionButton: const AddToDoFloatingAction(),
      );
    } else {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: CupertinoNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          middle: CupertinoSlidingSegmentedControl(
            groupValue: selectedSegment,
            onValueChanged: (Todos? value) {
              if (value != null) {
                setState(
                  () {
                    selectedSegment = value;
                  },
                );
              }
            },
            children: <Todos, Widget>{
              Todos.todos: segment(AppLocalizations.of(context)!.todos),
              Todos.done: segment(AppLocalizations.of(context)!.done),
            },
          ),
        ),
        body:
            selectedSegment == Todos.todos ? const TodosTab() : const DoneTab(),
        floatingActionButton: const AddToDoFloatingAction(),
      );
    }
  }

  Widget segment(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeConstants.s20),
      child: Text(text,
          style: TextStyle(color: Theme.of(context).colorScheme.primary)),
    );
  }
}
