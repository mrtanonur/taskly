import 'package:flutter/material.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/pages/language_page.dart';
import 'package:taskly/pages/theme_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThemePage(),
                  ));
            },
            leading: const Icon(Icons.settings),
            title: Text(AppLocalizations.of(context)!.theme),
            trailing: const Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LanguagePage(),
                  ));
            },
            leading: const Icon(Icons.flag),
            title: Text(AppLocalizations.of(context)!.language),
            trailing: const Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
