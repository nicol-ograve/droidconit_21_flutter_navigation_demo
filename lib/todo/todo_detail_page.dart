import 'package:droidconit_21_flutter_navigation_demo/todo/cubit/todo_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TodoDetailPage extends StatelessWidget {
  final int todoId;
  const TodoDetailPage({Key? key, required this.todoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoListCubit = context.read<TodoListCubit>();
    final todo =
        todoListCubit.state.todos.firstWhere((element) => element.id == todoId);

    return Scaffold(
        appBar: AppBar(title: Text('Todo detail: ${todo.id}')),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.title),
                SizedBox(
                  height: 16,
                ),
                Text(todo.completed ? 'Completed' : 'Not completed',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: todo.completed
                            ? Colors.orange[800]
                            : Colors.red[800])),
              ],
            )));
  }
}
