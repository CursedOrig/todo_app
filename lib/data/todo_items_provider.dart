import 'package:check_list_app/data/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TodoItemsProvider with ChangeNotifier {
  List<TodoItem> todoItems = [];

  Future<void> saveTodoItem(String label) async {
    final box = await Hive.openBox<TodoItem>('name');
    final key = DateTime.now().millisecondsSinceEpoch.toString();
    box.put(key, TodoItem(key: key, label: label, isDone: false));
    await loadTodoItems();
  }

  Future<void> invertDoneState(String key) async {
    final box = await Hive.openBox<TodoItem>('name');
    final TodoItem editableItem = box.get(key)!;
    final TodoItem newElement = TodoItem(key: editableItem.key, label: editableItem.label, isDone: !editableItem.isDone);
    box.put(key, newElement);
    await loadTodoItems();
  }

  Future<void> loadTodoItems() async {
    todoItems.clear();
    final box = await Hive.openBox<TodoItem>('name');
    todoItems.addAll(box.values);
    notifyListeners();
  }

  Future<void> deleteTodoItem(String key) async {
    final box = await Hive.openBox<TodoItem>('name');
    box.delete(key);
    loadTodoItems();
  }

  Future<void> clearAllData() async {
    final box = await Hive.openBox<TodoItem>('name');
    await box.clear();
    todoItems.clear();
    notifyListeners();
  }
}
