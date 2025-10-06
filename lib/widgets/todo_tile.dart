import 'package:flutter/material.dart';
import 'package:taskly/l10n/app_localizations.dart';
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
      key: GlobalKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: SizeConstants.s24),
        child: const Icon(Icons.delete),
      ),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(AppLocalizations.of(context)!.areYouSure),
              actions: [
                TextButton(
                    onPressed: () {
                      return Navigator.pop(context);
                    },
                    child: Text(AppLocalizations.of(context)!.cancel)),
                TextButton(
                  onPressed: onDeletePressed,
                  child: Text(AppLocalizations.of(context)!.delete),
                )
              ],
            );
          },
        );
      },
      child: ListTile(
        onTap: onTap,
        leading: Checkbox.adaptive(
          value: checkboxValue,
          onChanged: checkboxOnChanged,
        ),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
