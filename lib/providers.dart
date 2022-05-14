import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListNotifier extends StateNotifier<List<String>> {
  TodoListNotifier() : super([]);

  void add(String todo) {
    state.add(todo);
  }
}

final StateNotifierProvider<TodoListNotifier, List<String>>
    todoListNotifierProvider =
    StateNotifierProvider((ref) => TodoListNotifier());
