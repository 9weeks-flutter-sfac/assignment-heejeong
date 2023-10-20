import 'package:flutter/material.dart';
import 'package:train/todoApp/model/todo.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    //Dismissible: swipe를 했을 때 해당 내용을 지워줌
    //onDismissed를 이용해서 드래그 이후의 동작을 구현
    return Dismissible(
        key: Key(todo.id.toString()),
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: todo.completed ? Colors.green.shade100 : null,
              border: todo.completed ? Border.all(color: Colors.green) : null,
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                  color: todo.completed ? Colors.green : null,
                  fontWeight: FontWeight.bold),
            ),
            trailing: todo.completed
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : null,
          ),
        ));
  }
}
