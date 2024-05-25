import 'package:flutter/material.dart';
import 'package:pomoapp/home/todoChart//todo.dart';
import 'package:pomoapp/home/dateAndTimeChart/dateAndTime.dart';
import 'package:pomoapp/home/start/startButton.dart';
import 'package:pomoapp/home/motivationalTextChart/motivationalText.dart';
import 'package:pomoapp/home/footerButtons/addTodoButton/addTodoButton.dart';
import 'package:pomoapp/home/footerButtons/progressButton/progressButton.dart';
import 'package:pomoapp/home/footerButtons/profileButton/profileButton.dart';
import 'package:pomoapp/home/footerButtons/settingsButton/settingsButton.dart';

class Portrait extends StatefulWidget {
  const Portrait({super.key});

  @override
  State<Portrait> createState() => _PortraitState();
}

class _PortraitState extends State<Portrait> {
  Color cardColor = Colors.black;
  int checkbox = 1;
  String date = "2";
  String start = "3";
  String motivationalText = "4";
  String button_1 = "5";
  String button_2 = "6";
  String button_3 = "7";
  String button_4 = "8";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
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
                            setState(
                              () {
                                checkbox *= 2;
                              },
                            );
                          },
                          child: const StartButton(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MotivationalText(),
          const Expanded(
            child: Row(
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
    );
  }
}
