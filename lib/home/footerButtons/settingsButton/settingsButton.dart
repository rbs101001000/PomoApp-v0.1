import 'package:flutter/material.dart';
import 'package:pomoapp/reusableCard.dart';
import 'package:pomoapp/setting/setting.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Setting(),),);
        },
        child: const ReusableCard(
          borderRadius: 10,
          colour: Colors.black26,
          childCard: Icon(Icons.settings),
        ),
      ),
    );
  }
}
