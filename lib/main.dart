import 'package:bloc_pattern/blocs/todos/todos_bloc.dart';
import 'package:bloc_pattern/blocs/todos_filter/todos_filter_bloc.dart';
import 'package:bloc_pattern/models/todos_model.dart';
import 'package:bloc_pattern/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TodosBloc()
              ..add(LoadTodo(todos: [
                Todo(id: "1", task: "Sample ToDo 3", description: "ToDo 1"),
                Todo(id: "2", task: "Sample ToDo 2", description: "ToDo 2")
              ]))),
        BlocProvider(create: (context) => TodosFilterBloc(todosBloc: BlocProvider.of<TodosBloc>(context)))
      ],
      child: MaterialApp(
        title: 'Bloc pattern',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
