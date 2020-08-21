import 'package:flutter/material.dart';
import 'package:project_k/model/todo.dart';
import 'package:provider/provider.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<List<ToDo>>(context);
    ToDo selectedDay;

    print(todos);
    if (todos != null) {
      todos.forEach((todo) {
        //if the day is equal to selected day on calender then set items to that to-do's items
        if (todo.day == '20-08-20') {
          selectedDay = todo;
        }
        print(todo.day);
        print(todo.items);
      });
    } else {
      print('todo list is null');
    }

    return Container(
      child: Text(selectedDay.day + selectedDay.items.toString()),
    );
  }
}
