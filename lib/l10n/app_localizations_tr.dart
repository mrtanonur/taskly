// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get todos => 'Yapılacaklar';

  @override
  String get done => 'Tamamlandı';

  @override
  String get add => 'Ekle';

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
  String get system => 'Sistem';

  @override
  String get light => 'Açık';

  @override
  String get dark => 'Koyu';

  @override
  String get emptyFieldAlert => 'Lütfen bir metin girin';

  @override
  String get youDontHaveAnyDoneTodos => 'Tamamlanmış yapılacak işiniz yok';

  @override
  String get delete => 'Sil';

  @override
  String get areYouSure => 'Emin misiniz?';
}
