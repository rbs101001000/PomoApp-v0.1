import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import '../../../todo/add_todo.dart';

class AddTodoButton extends StatefulWidget {
  const AddTodoButton({super.key});

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoList()));
        },
        child: const ReusableCard(
          borderRadius: 10,
          colour: Colors.black26,
          childCard: Icon(Icons.checklist),
        ),
      ),
    );
  }
}
