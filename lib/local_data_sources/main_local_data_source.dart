import 'package:hive/hive.dart';

class MainLocalDataSource {
  static Box? box;

  static Future openBox() async {
    box = await Hive.openBox("main");
  }

  static Future add(String key, String value) async {
    await box!.put(key, value);
  }

  static String? read(String key) {
    return box!.get(key);
  }

  static Future delete(String key) async {
    await box!.delete(key);
  }
}
