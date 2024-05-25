import 'package:flutter/material.dart';
import 'package:pomoapp/home/todoChart//todo.dart';
import 'package:pomoapp/home/dateAndTimeChart/dateAndTime.dart';
import 'package:pomoapp/home/start/startButton.dart';
import 'package:pomoapp/home/motivationalTextChart//motivationalText.dart';
import 'package:pomoapp/home/footerButtons/addTodoButton/addTodoButton.dart';
import 'package:pomoapp/home/footerButtons/progressButton/progressButton.dart';
import 'package:pomoapp/home/footerButtons/profileButton/profileButton.dart';
import 'package:pomoapp/home/footerButtons/settingsButton/settingsButton.dart';

class Landscape extends StatefulWidget {
  const Landscape({super.key});

  @override
  State<Landscape> createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [const Expanded(
          flex: 2,
          child: MotivationalText(),
        ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                const TodoSection(),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const DateAndTime(),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                            });
                          },
                          child: const StartButton(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: Column(
                    children: [
                      AddTodoButton(),
                      ProgressButton(),
                      ProfileButton(),
                      SettingsButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}