import 'package:flutter/material.dart';
import 'package:pomoapp/progress/progress.dart';
import 'package:pomoapp/reusableCard.dart';

class ProgressButton extends StatefulWidget {
  const ProgressButton({super.key});

  @override
  State<ProgressButton> createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(

      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Progress()));
        },
        child: const ReusableCard(
          borderRadius: 10,
          colour: Colors.black26,
          childCard: Icon(Icons.show_chart),
        ),
      ),
    );
  }
}
