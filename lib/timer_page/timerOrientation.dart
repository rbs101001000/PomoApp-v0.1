import 'package:flutter/material.dart';
import 'package:pomoapp/timer_page/timer_page.dart';

class TimerOrientation extends StatefulWidget {
  const TimerOrientation({super.key});

  @override
  State<TimerOrientation> createState() => _TimerOrientationState();
}

class _TimerOrientationState extends State<TimerOrientation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Image(
                      image: AssetImage("lib/images/clock.png"),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                  ),
                  TimerBox(),
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Image(
                      image: AssetImage("lib/images/clock.png"),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                  ),
                  TimerBox(),
                ],
              ),
      ),
    );
  }
}
