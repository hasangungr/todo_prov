import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_model.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo(String desc) {
    var addingTodo = TodoModel(id: const Uuid().v4(), description: desc);

    state = [...state, addingTodo];
  }

  void toogle(String id) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id,
              description: todo.description,
              completed: !todo.completed)
        else
          todo
    ];
  }

  void edit({
    required String id,
    required String newDesc,
  }) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: todo.id, completed: todo.completed, description: newDesc)
        else
          todo
    ];
  }

  void remove(TodoModel removingId) {
    state = state.where((element) => element.id != removingId.id).toList();
  }

  int onCompletedTodoCount() {
    return state.where((element) => !element.completed).length;
  }
}
