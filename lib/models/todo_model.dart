import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final bool isDone;

  TodoModel({
    String? id,
    required this.name,
    required this.description,
    this.isDone = false,
  }) : id = id ?? const Uuid().v4();

  TodoModel copyWith({
    String? id,
    String? name,
    String? description,
    bool? isDone,
  }) {
    return TodoModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone);
  }
}
