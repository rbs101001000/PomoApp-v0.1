import 'package:flutter/material.dart';
import '../home/homePage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Profile Page"),
          ],
        ),
      ),

      body:
      const Center(child: Text("Null"))
    );
  }
}
