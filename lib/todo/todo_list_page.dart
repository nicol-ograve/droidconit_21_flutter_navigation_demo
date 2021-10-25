import 'package:droidconit_21_flutter_navigation_demo/common/model/todo.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/app_pages.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/cubit/todo_list_cubit.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/cubit/todo_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                context
                    .read<RoutingBloc>()
                    .add(RoutePushed(newPage: TodosCreatePageConfig));
              },
            )
          ],
        ),
        body: BlocBuilder<TodoListCubit, TodoListState>(
          builder: (context, state) {
            return ListView.builder(
                itemBuilder: (context, index) =>
                    _TodoListItem(todo: state.todos[index]),
                itemCount: state.todos.length);
          },
        ));
  }
}

class _TodoListItem extends StatelessWidget {
  final Todo todo;

  const _TodoListItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context
              .read<RoutingBloc>()
              .add(RoutePushed(newPage: TodoDetailPageConfig(todoId: todo.id)));
        },
        child: Row(
          children: [
            Checkbox(
                value: todo.completed,
                onChanged: (completed) {
                  if (completed != null)
                    context
                        .read<TodoListCubit>()
                        .updateTodoCompletionState(todo, completed);
                }),
            Text(
              todo.title,
              style: todo.completed
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
          ],
        ));
  }
}
