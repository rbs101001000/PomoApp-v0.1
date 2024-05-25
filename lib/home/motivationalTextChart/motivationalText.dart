import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';

class MotivationalText extends StatefulWidget {
  const MotivationalText({super.key});

  @override
  State<MotivationalText> createState() => _MotivationalTextState();
}

class _MotivationalTextState extends State<MotivationalText> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 3,
      child: ReusableCard(
        borderRadius: 20,
        colour: Colors.white12,
        childCard: Text("motivationalText",style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
