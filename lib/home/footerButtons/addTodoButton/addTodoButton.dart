import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import '../../../todo/add_todo.dart';
import 'package:url_launcher/url_launcher.dart';

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
          _launchURL();
          // Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoList()));
        },
        child: const ReusableCard(
          borderRadius: 10,
          colour: Colors.black26,
          childCard: Icon(Icons.question_mark),
        ),
      ),
    );
  }
  _launchURL() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
