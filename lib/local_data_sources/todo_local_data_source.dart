import 'package:hive/hive.dart';
import 'package:taskly/models/todo_model.dart';

class TodoLocalDataSource {
  static Box<TodoModel>? box;
  static Future openBox() async {
    box = await Hive.openBox("todo");
  }

  static Future add(TodoModel todo) async {
    await box!.put(todo.id, todo);
  }

  static List<TodoModel?> read() {
    return box!.values.toList();
  }

  static TodoModel find(String id) {
    return box!.values.firstWhere((todo) => todo.id == id);
  }

  static Future delete(String id) async {
    await box!.delete(id);
  }

  static Future clear() async {
    await box!.clear();
  }
}
