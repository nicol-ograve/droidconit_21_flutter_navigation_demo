import 'package:droidconit_21_flutter_navigation_demo/common/model/mocks/todo_list_mock.dart';
import 'package:droidconit_21_flutter_navigation_demo/common/model/todo.dart';
import 'package:droidconit_21_flutter_navigation_demo/todo/cubit/todo_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState(todos: mockedTodoList));

  void createTodo(String title) {
    emit(state.copyWith(
        todos: List.from(state.todos)
          ..add(Todo(
              id: state.todos.length + 1, title: title, completed: false))));
  }

  void updateTodoCompletionState(Todo todo, bool completed) {
    emit(state.copyWith(
        todos: state.todos
            .map((e) =>
                e.id == todo.id ? todo.copyWith(completed: completed) : e)
            .toList()));
  }
}
