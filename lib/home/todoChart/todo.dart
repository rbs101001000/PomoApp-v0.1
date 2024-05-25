import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import 'package:pomoapp/todo/todo_list.dart';

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
              colour: Colors.white60,
              childCard: ListView(
                children: const [
                  TodoList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
