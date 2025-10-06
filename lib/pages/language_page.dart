import 'package:flutter/material.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/providers/main_provider.dart';
import 'package:taskly/utils/constants/size_constants.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.language)),
      body: Padding(
        padding: const EdgeInsets.all(SizeConstants.s24),
        child: Column(
          children: [
            Row(
              children: [
                Checkbox.adaptive(
                  value: context.watch<MainProvider>().language == Languages.en,
                  onChanged: (value) {
                    context.read<MainProvider>().changeLanguage(Languages.en);
                  },
                ),
                const SizedBox(width: SizeConstants.s8),
                const Text(
                  "English",
                  style: TextStyle(fontSize: SizeConstants.s24),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox.adaptive(
                  value: context.watch<MainProvider>().language == Languages.tr,
                  onChanged: (value) {
                    context.read<MainProvider>().changeLanguage(Languages.tr);
                  },
                ),
                const SizedBox(width: SizeConstants.s8),
                const Text(
                  "Turkish",
                  style: TextStyle(fontSize: SizeConstants.s24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
