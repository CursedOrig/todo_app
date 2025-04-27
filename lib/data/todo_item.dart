import 'package:hive/hive.dart';

part 'todo_item.g.dart';

@HiveType(typeId: 0)
class TodoItem{
  @HiveField(0)
  final String key;
  @HiveField(1)
  final String label;
  @HiveField(2)
  final bool isDone;

  static List<TodoItem> defaultItemGenerator() => [
    TodoItem(key: '78567', label: 'eyt5y467', isDone: false),
    TodoItem(key: '6456', label: 'ertb', isDone: false),
    TodoItem(key: '4573', label: 'erbyr', isDone: false),
    TodoItem(key: '345345', label: 'done', isDone: true),
    TodoItem(key: '75843', label: 'zr6urt', isDone: false),
    TodoItem(key: '2352', label: 'zxuii', isDone: false),
  ];




  TodoItem({required this.key, required this.label, required this.isDone});
}
