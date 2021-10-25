import 'package:equatable/equatable.dart';

import 'package:droidconit_21_flutter_navigation_demo/common/model/todo.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  TodoListState({
    required this.todos,
  });

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object?> get props => [todos];
}
