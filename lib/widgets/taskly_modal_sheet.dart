import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/extensions/todo_operation_extension.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/providers/todo_provider.dart';
import 'package:taskly/utils/constants/size_constants.dart';
import 'package:taskly/widgets/taskly_textformfield.dart';

enum TodoOperation {
  add,
  update,
}

class TasklyModalSheet extends StatefulWidget {
  final TodoOperation operation;
  const TasklyModalSheet({super.key, required this.operation});

  @override
  State<TasklyModalSheet> createState() => _TasklyModalSheetState();
}

class _TasklyModalSheetState extends State<TasklyModalSheet> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    TodoProvider provider = context.read<TodoProvider>();

    if (widget.operation == TodoOperation.update) {
      final task = provider.tasks
          .firstWhere((task) => task!.id == provider.selectedTaskId);
      _nameController.text = task!.name;
      _descriptionController.text = task.description;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUnfocus,
      key: _globalKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: SizeConstants.s24),
            child: Text(widget.operation.localizedText(context),
                style: TextStyle(
                    fontSize: SizeConstants.s30,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary)),
          ),
          const SizedBox(
            height: SizeConstants.s24,
          ),
          TasklyTextformfield(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.emptyFieldAlert;
              }
              return null;
            },
            hintText: AppLocalizations.of(context)!.name,
          ),
          TasklyTextformfield(
              controller: _descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.emptyFieldAlert;
                }
                return null;
              },
              hintText: AppLocalizations.of(context)!.description),
          const SizedBox(
            height: SizeConstants.s48,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: SizeConstants.s24),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_globalKey.currentState!.validate()) {
                        TodoProvider provider = context.read<TodoProvider>();
                        if (widget.operation == TodoOperation.add) {
                          await context.read<TodoProvider>().add(
                                _nameController.text,
                                _descriptionController.text,
                              );
                        } else {
                          context.read<TodoProvider>().update(
                              provider.selectedTaskId!,
                              _nameController.text,
                              _descriptionController.text);
                        }

                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.outline),
                      foregroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.surface),
                    ),
                    child: Text(widget.operation.localizedText(context)),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.error),
                        foregroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.surface),
                      ),
                      child: Text(AppLocalizations.of(context)!.cancel)),
                ]),
          )
        ],
      ),
    );
  }
}
