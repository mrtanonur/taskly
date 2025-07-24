import 'package:flutter/material.dart';
import 'package:taskly/local_data_sources/todo_local_data_source.dart';
import 'package:taskly/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  int? detailIndex;
  List<TodoModel?> tasks = [];

  Future add(String id, String name, String description) async {
    TodoModel todoModel =
        TodoModel(id: id, name: name, description: description);
    tasks.add(todoModel);
    await TodoLocalDataSource.add(todoModel);
    notifyListeners();
  }

  void getTodos() {
    final List<TodoModel?> localTodos = TodoLocalDataSource.read();
    tasks = localTodos;
  }

  void update(String id, String name, String description) async {
    tasks[detailIndex!]!.copyWith(name: name, description: description);

    final localTodo = TodoLocalDataSource.find(id);
    await localTodo.save();
    notifyListeners();
  }

  void remove(String id) async {
    TodoModel? task = tasks.firstWhere((item) => item!.id == id);
    tasks.remove(task);
    TodoLocalDataSource.delete(id);
    notifyListeners();
  }

  void toggleIsDone(TodoModel todoModel) async {
    todoModel.copyWith(isDone: !todoModel.isDone);
    await todoModel.save();
    notifyListeners();
  }

  void changeDetailIndex(int index) {
    detailIndex = index;
    notifyListeners();
  }
}
