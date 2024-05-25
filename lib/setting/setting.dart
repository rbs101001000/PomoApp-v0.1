import 'package:flutter/material.dart';
import 'package:pomoapp/home/homePage.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Setting Page"),
          ],
        ),
      ),
      body:
        const Center( child: Text("Null"),)
    );
  }
}
