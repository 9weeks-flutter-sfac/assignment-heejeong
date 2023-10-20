import 'package:dio/dio.dart';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        userId: map['userId'],
        id: map['id'],
        title: map['title'],
        completed: map['completed']);
  }

  @override
  String toString() {
    return 'Todo($title)';
  }
}

Future<Todo?> getData(todoNumber) async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/todos/$todoNumber';
  var res = await dio.get(url);
  if (res.statusCode == 200) {
    return Todo.fromMap(res.data);
  }
  return null;
}

Future<List<Todo>> readData() async {
  Dio dio = Dio();
  var url = 'https://jsonplaceholder.typicode.com/todos';
  var res = await dio.get(url);
  if (res.statusCode == 200) {
    var data = List<Map<String, dynamic>>.from(res.data);
    return data.map((e) => Todo.fromMap(e)).toList();
  }
  return [];
}

void main() async {
  // var todoNumber = 5;
  // var data = await getData(todoNumber);
  var allTodos = await readData();
  print(allTodos);
}
