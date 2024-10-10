import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../models/models.dart';

abstract class IService{
  Future<List<Todo>> getTodos();
}


@LazySingleton(as: IService)
class TodoService extends IService {

  final http.Client httpClient;
  TodoService(this.httpClient);

  final _authority = 'jsonplaceholder.typicode.com';
  final _pathPosts = 'todos';

  final _requestHeaders = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };
  
  @override
  Future<List<Todo>> getTodos() async{

    final urlPosts = Uri.https(_authority,_pathPosts);

    final response = await httpClient.get(urlPosts,headers: _requestHeaders);
    
    final responseBody = response.body;
    
    final List decodedBody = jsonDecode(responseBody);
    
    final iterable = decodedBody.map((e)=>Todo.fromJson(e));
    
    final listTodos = List<Todo>.from(iterable);

    if(response.statusCode == 200){
      return listTodos;
    }else{
      throw Exception(
        'Veriler Alınamadı. Hata Kodu: ${response.statusCode}',
      );
    }
  }
  
}