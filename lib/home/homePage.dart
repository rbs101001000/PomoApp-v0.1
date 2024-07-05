import 'package:flutter/material.dart';
import 'orientations/portrait.dart';
import 'orientations/landscape.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark().copyWith(background: Colors.teal),
        appBarTheme: const AppBarTheme(color: Color.fromRGBO(1, 75, 68, 100),)
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("POMO",style: TextStyle(fontWeight: FontWeight.bold,),),
        // ),
        body: MediaQuery.of(context).orientation == Orientation.portrait
            ? const Portrait()
            : const Landscape(),
      ),
    );
  }
}