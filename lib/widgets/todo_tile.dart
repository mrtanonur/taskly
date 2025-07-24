import 'package:flutter/material.dart';
import 'package:taskly/utils/constants/constants.dart';

class TodoTile extends StatelessWidget {
  final void Function(bool?)? checkboxOnChanged;
  final bool checkboxValue;
  final String title;
  final String subtitle;
  final void Function()? onTap;
  final void Function()? onDeletePressed;
  const TodoTile(
      {super.key,
      required this.checkboxValue,
      required this.checkboxOnChanged,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: Container(
        color: ColorConstants.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: SizeConstants.s24),
        child: const Icon(Icons.delete),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text("Are you sure?"),
              actions: [
                TextButton(
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
                TextButton(
                  onPressed: onDeletePressed,
                  child: const Text("Delete"),
                )
              ],
            );
          },
        );
      },
      key: GlobalKey(),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Checkbox(
            value: checkboxValue,
            onChanged: checkboxOnChanged,
          ),
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
