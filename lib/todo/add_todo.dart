import 'package:flutter/material.dart';
import 'package:pomoapp/todo/todo_list.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text(
                "Todo Page",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
            children: [
              const TodoList(),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    //number+=1;
                  });
                },
                backgroundColor: Colors.white54,
                child: const Icon(Icons.add),
              )
            ],
        ),

      ]),
    );
  }
}
