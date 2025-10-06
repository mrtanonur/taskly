import 'package:flutter/material.dart';
import 'package:taskly/utils/constants/constants.dart';
import 'package:taskly/widgets/taskly_modal_sheet.dart';

class AddToDoFloatingAction extends StatefulWidget {
  const AddToDoFloatingAction({super.key});

  @override
  State<AddToDoFloatingAction> createState() => _AddToDoFloatingActionState();
}

class _AddToDoFloatingActionState extends State<AddToDoFloatingAction> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 1,
          context: context,
          builder: (context) {
            return const Padding(
              padding: EdgeInsets.all(SizeConstants.s24),
              child: TasklyModalSheet(operation: TodoOperation.add),
            );
          },
        );
      },
    );
  }
}
