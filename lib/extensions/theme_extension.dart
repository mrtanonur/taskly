import 'package:flutter/material.dart';
import 'package:taskly/l10n/app_localizations.dart';

extension ThemeExtension on ThemeMode {
  String localizedText(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return AppLocalizations.of(context)!.system;
      case ThemeMode.light:
        return AppLocalizations.of(context)!.light;
      case ThemeMode.dark:
        return AppLocalizations.of(context)!.dark;
    }
  }
}
