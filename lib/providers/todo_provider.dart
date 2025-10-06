import 'package:flutter/material.dart';
import 'package:taskly/local_data_sources/todo_local_data_source.dart';
import 'package:taskly/models/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel?> tasks = [];
  String? selectedTaskId;

  void setSelectedTask(String id) {
    selectedTaskId = id;
  }

  Future add(String name, String description) async {
    TodoModel todoModel = TodoModel(name: name, description: description);
    tasks.add(todoModel);
    await TodoLocalDataSource.add(todoModel);
    notifyListeners();
  }

  void getTodos() {
    final List<TodoModel?> localTodos = TodoLocalDataSource.read();
    tasks = localTodos;
  }

  void update(String id, String name, String description) async {
    TodoModel? task = tasks.firstWhere((task) => task!.id == id);
    final index = tasks.indexOf(task);
    final newTodo = task!.copyWith(name: name, description: description);

    tasks[index] = newTodo;

    TodoLocalDataSource.add(newTodo);
    // final localTodo = TodoLocalDataSource.find(id);
    await newTodo.save();
    notifyListeners();
  }

  void remove(String id) async {
    TodoModel? task = tasks.firstWhere((item) => item!.id == id);
    tasks.remove(task);
    TodoLocalDataSource.delete(id);
    notifyListeners();
  }

  void toggleIsDone(TodoModel todoModel) async {
    final index = tasks.indexWhere((t) => t!.id == todoModel.id);

    final newTodo = todoModel.copyWith(isDone: !todoModel.isDone);
    tasks[index] = newTodo;

    TodoLocalDataSource.add(newTodo);
    await newTodo.save();
    notifyListeners();
  }
}
