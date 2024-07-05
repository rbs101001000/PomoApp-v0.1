import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  Widget build(BuildContext context) {
    return const Scaffold(
      body: PomodoroScreen(),
    );
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pomodoro Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timerType == TimerType.work ? 'Work Time' : 'Break Time',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              '${remainingTime ~/ 60}:${(remainingTime % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isRunning ? null : startTimer,
                  child: const Text('Start'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: isRunning ? stopTimer : null,
                  child: const Text('Stop'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: resetTimer,
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveProgress,
        child: const Icon(Icons.save),
      ),
    );
  }
}

enum TimerType {
  work,
  breakTime,
}