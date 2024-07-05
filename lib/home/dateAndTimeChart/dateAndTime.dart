import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import 'package:intl/intl.dart';


class DateAndTime extends StatefulWidget {
  const DateAndTime({super.key});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {

  String? _timeString;
  String? _secondString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    setState(() {
      _timeString = DateFormat('hh:mm',).format(DateTime.now());
      _secondString = DateFormat('ss').format(DateTime.now());
    });
    // Update the time every second
    Future.delayed(const Duration(seconds: 1), () => _updateTime());
  }

  int dayCounter = 0;
  int specificTime = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ReusableCard(
        borderRadius: 20,
        colour: Colors.white60,
        childCard: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider( color: Colors.white70,),
            Text(
              _timeString?? " error",
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text(_secondString??"error", style: TextStyle(fontSize: 20),),
            Divider(color: Colors.white70,)
          ],
        ),
      ),
    );
  }
}