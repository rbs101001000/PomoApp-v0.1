import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';


class TimerBox extends StatefulWidget {
  const TimerBox({super.key});

  @override
  _TimerBoxState createState() => _TimerBoxState();
}

class _TimerBoxState extends State<TimerBox> {
  int workTime = 25; // work time in minutes
  int breakTime = 5; // break time in minutes
  int remainingTime = 0;
  bool isRunning = false;
  TimerType timerType = TimerType.work;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    loadProgress();
  }

  Future<void> openFocusModeSettings() async {
    const platform = MethodChannel(
        'com.example.focus_mode_channel'); // Replace with your desired channel name

    try {
      await platform.invokeMethod('openFocusModeSettings');
    } on PlatformException catch (e) {
      print('Failed to open focus mode settings: ${e.message}');
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          if (timerType == TimerType.work) {
            timerType = TimerType.breakTime;
            remainingTime = breakTime * 60;
          } else {
            timerType = TimerType.work;
            remainingTime = workTime * 60;
          }
        }
      });
    });
  }

  void stopTimer() {
    setState(() {
      isRunning = false;
    });
    timer?.cancel();
  }

  void resetTimer() {
    setState(() {
      isRunning = false;
      timerType = TimerType.work;
      remainingTime = workTime * 60;
    });
  }

  void saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('workTime', workTime);
    prefs.setInt('breakTime', breakTime);
  }

  void loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      workTime = prefs.getInt('workTime') ?? 25;
      breakTime = prefs.getInt('breakTime') ?? 5;
      remainingTime = workTime * 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white,width: 3),
        borderRadius: BorderRadius.circular(30),
        color: Colors.black26,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      padding: const EdgeInsetsDirectional.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            timerType == TimerType.work ? 'Work Time' : 'Break Time',
            style: const TextStyle(fontSize: 44,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}',
            style: const TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsetsDirectional.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.black12,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white)),
                  onPressed: isRunning ? null : startTimer,
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white)),
                  onPressed: isRunning ? stopTimer : null,
                  child: const Icon(
                    Icons.stop,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white)),
                  onPressed: resetTimer,
                  child: const Icon(
                    Icons.restart_alt_sharp,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Turn on focus mode: ",style: TextStyle(fontSize: 20),),
              Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                    activeColor: Colors.white70,
                    value: true,
                    onChanged: (bool val) {}),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

enum TimerType {
  work,
  breakTime,
}
