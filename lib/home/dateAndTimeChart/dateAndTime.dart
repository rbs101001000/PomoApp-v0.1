import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';

class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  // DateAndTime date = DateAndTime(key: ,);
  int dayCounter = 0;
  int specificTime = 0;

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 3,
      child: ReusableCard(
        borderRadius: 20,
        colour: Colors.white60,
        childCard: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_drop_down),
            Text("28th Apr",style: TextStyle(fontWeight: FontWeight.bold),),
            Text("Day 1"),
            Text("of"),
            Text("100 Days",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
            Icon(Icons.arrow_drop_up)
          ],
        ),
      ),
    );
  }
}