import 'package:flutter/material.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/widgets/taskly_modal_sheet.dart';

extension TodoOperationExtension on TodoOperation {
  String localizedText(BuildContext context) {
    switch (this) {
      case TodoOperation.add:
        return AppLocalizations.of(context)!.add;
      case TodoOperation.update:
        return AppLocalizations.of(context)!.update;
    }
  }
}
