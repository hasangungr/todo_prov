import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bussines/todo_list_manager.dart';
import '../models/todo_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>(
        (ref) => TodoListManager());
