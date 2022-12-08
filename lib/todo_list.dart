import 'package:flutter/material.dart';
import 'package:todo_assignment/bottom_nav_bar.dart';
import 'package:todo_assignment/floating_actionbutton.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'custom_scrollbar.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoList();

}

class _TodoList extends State<TodoList> {

  List todos = <dynamic> [];

  @override
  void initState() {
    getTodo();
    super.initState();
  }

  getTodo() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url));
    setState(() {
      todos = convert.jsonDecode(response.body);
     }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-do list Page"),
        leading: const Icon(Icons.fact_check_outlined),
      ),
      body: CustomScrollBar(
        builder: (controller) => ListView.builder(
          padding: const EdgeInsets.all(10),
          controller: controller,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionTile(
              backgroundColor: Colors.grey[100],
              expandedAlignment: Alignment.center,
              title: Text(todos[index]["title"]),
              leading: const Icon(Icons.check_box_outline_blank),
              trailing: const SizedBox.shrink(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 25
                  ),
                  child: Text(
                    todos[index]["body"],
                    style: const TextStyle(
                      fontStyle: FontStyle.italic
                    ),
                  ),
                )
              ]
            );
          },
        ),
      ),
      floatingActionButton: const ActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
