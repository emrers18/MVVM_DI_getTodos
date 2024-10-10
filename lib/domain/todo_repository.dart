import 'package:injectable/injectable.dart';

import '/data/data.dart';

abstract class IRepository{
  Future<List<Todo>> getTodos();
}

@LazySingleton(as: IRepository)
class TodoRepository extends IRepository{
  
  final IService todoService;
  TodoRepository({required this.todoService});
  
  @override
  Future<List<Todo>> getTodos()=> todoService.getTodos();
  
}