import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../register/loginScreen.dart';
import 'settingFunctions.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}


class _SettingState extends State<Setting> {
  SettingFunctions settingFunctions = SettingFunctions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Setting",style: TextStyle(fontSize: 30),),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                width: double.maxFinite,
                child: Divider(
                  color: Colors.white70,
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Change password", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){
                        settingFunctions.changePasswordDialog(context);
                      },
                      child: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Change Name", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){
                        settingFunctions.changeNameDialog(context);
                      },
                      child: const Icon(Icons.arrow_forward_ios,))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Change Email", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){
                        settingFunctions.changeEmailDialog(context);
                      },
                      child: const Icon(Icons.arrow_forward_ios))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Change Bio", style: TextStyle(fontSize: 20),),
                  GestureDetector(
                      onTap: (){
                        settingFunctions.changeBio(context);
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
                width: double.maxFinite,
                child: Divider(
                  color: Colors.white70,
                  thickness: 3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Todo tasks", style: TextStyle(fontSize: 20),),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Colors.white70,
                        value: true, onChanged: (bool val){
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Workings sessions alert", style: TextStyle(fontSize: 20),),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Colors.white70,
                        value: true, onChanged: (bool val){
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Work/Study time alert", style: TextStyle(fontSize: 20),),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Colors.white70,
                        value: true, onChanged: (bool val){
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              const Row(
                children: [
                  Icon(Icons.remove_red_eye_sharp),
                  SizedBox(width: 10,),
                  Text("Appearance", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(
                  width: double.maxFinite,
                  child: Divider(
                    color: Colors.white70,
                    thickness: 3,
                  ),),
              const SizedBox(
                height: 10,
              ),
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
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Timer theme", style: TextStyle(fontSize: 20),),
                  Transform.scale(
                    scale: 0.7,
                    child: CupertinoSwitch(
                        activeColor: Colors.white70,
                        value: true, onChanged: (bool val){
                    }),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.white30)),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                    },
                    child: const Row(
                    children: [
                      Text("Log out  ", style: TextStyle(color: Colors.white),),
                      Icon(Icons.logout,color: Colors.white,),
                    ],
                  ),),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}