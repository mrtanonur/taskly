import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskly/extensions/theme_extension.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/providers/main_provider.dart';
import 'package:taskly/utils/constants/constants.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.theme),
        ),
        body: Padding(
          padding: const EdgeInsets.all(SizeConstants.s24),
          child: ListView.separated(
            itemCount: ThemeMode.values.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: SizeConstants.s8,
              );
            },
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Checkbox.adaptive(
                      value: context.watch<MainProvider>().themeMode ==
                          ThemeMode.values[index],
                      onChanged: (value) async {
                        context
                            .read<MainProvider>()
                            .changeTheme(ThemeMode.values[index]);
                      }),
                  const SizedBox(
                    width: SizeConstants.s8,
                  ),
                  Text(ThemeMode.values[index].localizedText(context),
                      style: TextStyle(
                          fontSize: SizeConstants.s24,
                          color: Theme.of(context).colorScheme.primary)),
                ],
              );
            },
          ),
        ));
  }
}
