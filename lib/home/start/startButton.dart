import 'package:flutter/material.dart';
import 'package:pomoapp/timer_page/timer_page.dart';

class StartButton extends StatefulWidget {
  const StartButton({super.key});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {

  void navigateToTimerPage(){
    final route = MaterialPageRoute(builder: (context)=>const TimerPage());
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: navigateToTimerPage,
      // style: ButtonStyle(
      //   backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange),
      // ),
      style: TextButton.styleFrom(
        backgroundColor: Colors.orange,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.white, width: 3),

        )
      ),
      child: const Text(
        "START",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 40),
      ),
    );
  }
}
