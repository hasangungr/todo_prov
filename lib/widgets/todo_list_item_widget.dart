import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_prov/providers/all_providers.dart';

import '../models/todo_model.dart';

class TodoListItemWidget extends ConsumerWidget {
  TodoModel item;
  TodoListItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: Checkbox(
        value: item.completed,
        onChanged: (value) {
          ref.read(todoListProvider.notifier).toogle(item.id);
        },
      ),
      title: Text(item.description),
    );
  }
}
