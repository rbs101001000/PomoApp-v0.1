import 'package:flutter/material.dart';
import 'package:pomoapp/register/loginScreen.dart';
import 'package:pomoapp/register/signUpScreen.dart';
import 'package:pomoapp/welcomeScreen.dart';
import 'home/homePage.dart';


void main() {
  runApp(const PomoApp(),
  );
}

class PomoApp extends StatelessWidget {
  const PomoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "loginScreen",
      routes: {
        'loginScreen': (context)=>const LoginPage(),
        'sighUpScreen': (context)=>const SignUpPage(),
        'homePage': (context)=>const HomePage(),
      },
    );
  }
}



