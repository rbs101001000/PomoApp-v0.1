import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Text("Setting"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              const Row(
                children: [
                  Icon(Icons.account_circle,),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Account Settings", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                ],
              ),
              const SizedBox(
                height: 10,
                width: 300,
                child: Divider(
                  color: Colors.white70,
                  thickness: 3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Change password", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){},
                      child: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Social", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){},
                      child: const Icon(Icons.arrow_forward_ios,))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Language", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){

                      },
                      child: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Content setting", style: TextStyle(fontSize: 16),),
                  GestureDetector(
                      onTap: (){

                      },
                      child: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Icon(Icons.notifications),
                  SizedBox(width: 10,),
                  Text("Notification",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(
                height: 10,
                width: 300,
                child: Divider(
                  color: Colors.white70,
                  thickness: 3,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todo tasks", style: TextStyle(fontSize: 20),),
                  Icon(Icons.forward)
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Workings sessions alert", style: TextStyle(fontSize: 20),),
                  Icon(Icons.forward)
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Work/Study time alert", style: TextStyle(fontSize: 20),),
                  Icon(Icons.forward)
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                children: [
                  Icon(Icons.forward),
                  SizedBox(width: 10,),
                  Text("Appearance", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(
                  width: 300,
                  child: Divider(
                    color: Colors.white70,
                    thickness: 3,
                  ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Theme color", style: TextStyle(fontSize: 20),),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Colors.white70,
                        value: true, onChanged: (bool val){

                    }),
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("something", style: TextStyle(fontSize: 20),),
                  Icon(Icons.forward)
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
