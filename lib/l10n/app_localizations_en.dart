// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get todos => 'Todos';

  @override
  String get done => 'Done';

  @override
  String get add => 'Add';

  @override
  String get name => 'Name';

  @override
  String get description => 'Description';

  @override
  String get cancel => 'Cancel';

  @override
  String get update => 'Update';

  @override
  String get tasks => 'Tasks';

  @override
  String get settings => 'Settings';

  @override
  String get theme => 'Theme';

  @override
  String get language => 'Language';

  @override
  String get system => 'system';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get emptyFieldAlert => 'Please enter some text';

  @override
  String get youDontHaveAnyDoneTodos => 'You don\'t have any done todos';

  @override
  String get delete => 'Delete';

  @override
  String get areYouSure => 'Are you sure?';
}
