import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/models/todo_model.dart';
import 'package:taskly/providers/todo_provider.dart';
import 'package:taskly/utils/constants/size_constants.dart';
import 'package:taskly/widgets/taskly_modal_sheet.dart';
import 'package:taskly/widgets/todo_tile.dart';

class TodosTab extends StatefulWidget {
  const TodosTab({super.key});

  @override
  State<TodosTab> createState() => _TodosTabState();
}

class _TodosTabState extends State<TodosTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        List<TodoModel?> todos =
            provider.tasks.where((task) => task!.isDone == false).toList();
        return ListView.separated(
          itemCount: provider.tasks
              .where((task) => task!.isDone == false)
              .toList()
              .length,
          separatorBuilder: (context, index) {
            return const SizedBox(height: SizeConstants.s8);
          },
          itemBuilder: (context, index) {
            return TodoTile(
                onDeletePressed: () {
                  context.read<TodoProvider>().remove(todos[index]!.id);
                  Navigator.pop(context);
                },
                onTap: () {
                  provider.setSelectedTask(todos[index]!.id);
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const TasklyModalSheet(
                          operation: TodoOperation.update);
                    },
                  );
                },
                checkboxValue: todos[index]!.isDone,
                checkboxOnChanged: (value) {
                  provider.toggleIsDone(todos[index]!);
                },
                title: todos[index]!.name,
                subtitle: todos[index]!.description);
          },
        );
      },
    );
  }
}
