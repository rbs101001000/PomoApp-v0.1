import 'package:flutter/material.dart';
// import 'package:pomoapp/home/homePage.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Progress Page"),
          ],
        ),
      ),
      body: const Center(
        child: Text("Null"),
      ),
    );
  }
}
