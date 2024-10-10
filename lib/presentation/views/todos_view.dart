import 'package:flutter/material.dart';
import 'package:mvvm/domain/todo_repository.dart';
import 'package:mvvm/presentation/widgets/success_todos.dart';

import '../widgets/widgets.dart';
import '/core/di/injection.dart';
import '/data/data.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {

  final IRepository _todoRepository =getIt<IRepository>();
  late Future<List<Todo>> _future;

  @override
  void initState() {
    super.initState();
    _future = _todoRepository.getTodos();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        appTitle: 'Todos ',
      ),
      body: FutureBuilder<List<Todo>>(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            ///

            return SuccessTodos(
              todos: snapshot.data,
            );
          } else if (snapshot.hasError) {
            return ApiErrorWidget(
              errorMessage: 'Veriler alınamadı. Hata mesajı: ${snapshot.error}',
            );
          } else {
            return const LoadingWidget(
              text: 'Veriler yükleniyor...',
            );
          }
        },
      ),
    );
  }
}