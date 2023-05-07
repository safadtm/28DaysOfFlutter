// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day18_todo_app/loading_view.dart';
import 'package:day18_todo_app/models/Todo.dart';
import 'package:day18_todo_app/todo_cubit.dart';

class TodosView extends StatefulWidget {
  const TodosView({
    Key? key,
  }) : super(key: key);

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  final __titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      floatingActionButton: _floatingActionButton(),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is ListTodosSuccess) {
            return state.todos.isEmpty
                ? _emptyTodosView()
                : _todoListView(state.todos);
          } else if (state is ListTodosFailure) {
            return _exceptionView(state.exception);
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(
      child: Text(exception.toString()),
    );
  }

  Widget _todoListView(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return Card(
          child: CheckboxListTile(
            title: Text(todo.title),
            value: todo.isCompleted??false,
            onChanged: (newValue) {
              BlocProvider.of<TodoCubit>(context).updateTodoIsComplete(
                todo,
                newValue!,
              );
            },
          ),
        );
      },
    );
  }

  AppBar _navBar() {
    return AppBar(
      title: const Text("ToDo"),
    );
  }

  Widget _newTodoView() {
    return Column(
      children: [
        TextField(
          controller: __titleController,
          decoration: const InputDecoration(hintText: "Enter todo title"),
        ),
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<TodoCubit>(context)
                .createTodo(__titleController.text);
            __titleController.text = "";
            Navigator.of(context).pop();
          },
          child: const Text("Save Todo"),
        ),
      ],
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => _newTodoView(),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _emptyTodosView() {
    return const Center(
      child: Text("No todos yet"),
    );
  }
}
