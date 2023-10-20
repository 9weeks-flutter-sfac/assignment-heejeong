import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:train/todoApp/model/todo.dart';
import 'package:train/todoApp/widget/filter_bottom_sheet.dart';
import 'package:train/todoApp/widget/todo_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var url = 'https://jsonplaceholder.typicode.com/todos';
  Dio dio = Dio();
  List<Todo> todos = [];
  TodoFilter todoFilter = TodoFilter.all;

  readTodos() async {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(res.data);
      setState(() => todos = data.map((e) => Todo.fromMap(e)).toList());
    }
  }

  @override
  void initState() {
    super.initState();
    readTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        //appbar뒤에도 widget을 넣어줌
        flexibleSpace: ClipRect(
            //넘어가는 부분 자동으로 잘라줌
            child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(),
        )),
        title: Text('Todo App'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => FilterBottomSheet(
                        filter: todoFilter,
                        onApply: (value) {
                          print(value);
                          setState(() => todoFilter = value);
                        }));
              },
              icon: Icon(Icons.filter_alt)),
          IconButton(
              onPressed: () {
                readTodos();
              },
              icon: Icon(Icons.refresh_sharp))
        ],
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) =>
              TodoCard(todo: filterMaker(todos)[index])),
    );
  }

  List<Todo> filterMaker(List<Todo> value) {
    //todoFilter
    switch (todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value.where((element) => element.completed == true).toList();
      case TodoFilter.incompleted:
        return value.where((element) => element.completed == false).toList();
    }
  }
}
