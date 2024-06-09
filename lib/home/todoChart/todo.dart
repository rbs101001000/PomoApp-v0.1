import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import 'package:pomoapp/todo/add_todo.dart';

class TodoSection extends StatefulWidget {
  const TodoSection({super.key});

  @override
  State<TodoSection> createState() => _TodoSectionState();
}

class _TodoSectionState extends State<TodoSection> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            child: ReusableCard(
              borderRadius: 20,
              colour: Colors.black12,
              childCard: ListView(
                children: [
                  TodoList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
