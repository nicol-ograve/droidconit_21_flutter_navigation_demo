import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_bloc.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/routing/bloc/routing_event.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/cubit/todo_list_cubit.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoCreatePage extends StatelessWidget {
  final TextEditingController titleFieldController = TextEditingController();
  TodoCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Create new todo')),
        body: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Title'),
              TextFormField(controller: titleFieldController),
              SizedBox(height: 16),
              Center(
                  child: MaterialButton(
                onPressed: () {
                  context
                      .read<TodoListCubit>()
                      .createTodo(titleFieldController.text);

                  context.read<RoutingBloc>().add(RoutePopped());
                },
                child: Text('Create'),
                color: Colors.orange,
              ))
            ])));
  }
}
