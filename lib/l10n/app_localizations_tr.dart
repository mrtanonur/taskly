// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get todos => 'yapılacaklar';

  @override
  String get done => 'tamamlandı';

  @override
  String get add => 'ekle';

  @override
  String get name => 'İsim';

  @override
  String get description => 'Açıklama';

  @override
  String get cancel => 'İptal';

  @override
  String get update => 'Güncelle';

  @override
  String get tasks => 'Görevler';

  @override
  String get settings => 'Ayarlar';

  @override
  String get theme => 'Tema';

  @override
  String get language => 'Dil';

  @override
  String get system => 'sistem';

  @override
  String get light => 'açık';

  @override
  String get dark => 'koyu';

  @override
  String get emptyFieldAlert => 'Lütfen bir metin girin';
}
