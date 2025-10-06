import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:taskly/l10n/app_localizations.dart';
import 'package:taskly/local_data_sources/main_local_data_source.dart';
import 'package:taskly/local_data_sources/todo_local_data_source.dart';
import 'package:taskly/models/todo_model.dart';
import 'package:taskly/pages/home_page.dart';
import 'package:taskly/providers/main_provider.dart';
import 'package:taskly/providers/todo_provider.dart';
import 'package:taskly/utils/themes/dark_theme.dart';
import 'package:taskly/utils/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(TodoModelAdapter());
  await MainLocalDataSource.openBox();
  await TodoLocalDataSource.openBox();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TodoProvider()),
      ChangeNotifierProvider(create: (context) => MainProvider()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<MainProvider>().themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(context.watch<MainProvider>().language.name),
      home: HomePage(),
    );
  }
}
