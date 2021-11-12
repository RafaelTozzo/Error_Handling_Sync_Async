import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final todo = await fetch();
  print(todo.toJason());
}

Future<Todo> fetch() async {
  var url = 'https://jsonplaceholder.typicode.com/todos/1';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var todo = Todo.fromJason(json);
  return todo;
}

class Todo {
  final String title;
  final int userId;
  final int id;
  final bool completed;

  Todo({
    required this.title,
    required this.userId,
    required this.id,
    required this.completed,
  });

  factory Todo.fromJason(Map json) {
    return Todo(
      title: json['title'],
      userId: json['userId'],
      id: json['id'],
      completed: json['completed'],
    );
  }

  Map toJason() {
    return {
      'title': title,
      'userId': userId,
      'id': id,
      'completed': completed,
    };
  }
}
