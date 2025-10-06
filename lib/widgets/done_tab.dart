import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/models/todo_model.dart';
import 'package:taskly/providers/todo_provider.dart';
import 'package:taskly/utils/constants/constants.dart';
import 'package:taskly/widgets/taskly_modal_sheet.dart';
import 'package:taskly/widgets/todo_tile.dart';

class DoneTab extends StatefulWidget {
  const DoneTab({super.key});

  @override
  State<DoneTab> createState() => _DoneTabState();
}

class _DoneTabState extends State<DoneTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        if (provider.tasks.isNotEmpty) {
          List<TodoModel?> doneTodos =
              provider.tasks.where((task) => task!.isDone == true).toList();

          return ListView.separated(
            itemCount: doneTodos.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: SizeConstants.s8);
            },
            itemBuilder: (context, index) {
              return TodoTile(
                  onDeletePressed: () {
                    context.read<TodoProvider>().remove(doneTodos[index]!.id);
                    Navigator.pop(context);
                  },
                  onTap: () {
                    provider.setSelectedTask(doneTodos[index]!.id);

                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const TasklyModalSheet(
                            operation: TodoOperation.update);
                      },
                    );
                  },
                  checkboxValue: doneTodos[index]!.isDone,
                  checkboxOnChanged: (value) {
                    provider.toggleIsDone(doneTodos[index]!);
                  },
                  title: doneTodos[index]!.name,
                  subtitle: doneTodos[index]!.description);
            },
          );
        } else {
          return Center(
            child: Text(AppLocalizations.of(context)!.youDontHaveAnyDoneTodos),
          );
        }
      },
    );
  }
}
