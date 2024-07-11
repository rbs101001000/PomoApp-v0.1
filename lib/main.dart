import 'package:flutter/material.dart';
import 'package:pomoapp/register/loginScreen.dart';
import 'package:pomoapp/register/signUpScreen.dart';
import 'home/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // AwesomeNotifications().initialize(null,
  //   [
  //     NotificationChannel(channelKey: 'basic channel', channelName: 'Pomo', channelDescription: 'hello brother'),
  //   ],
  // );
  runApp(const PomoApp(),
  );
}

class PomoApp extends StatefulWidget {
  const PomoApp({super.key,});
  final bool isRegistered = false;

  @override
  State<PomoApp> createState() => PomoAppState();
}

class PomoAppState extends State<PomoApp> {

  // @override
  // void initState() {
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed){
  //     if(!isAllowed){
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  //   super.initState();
  // }

  void saveValue(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRegistered', false);
  }

  Future<bool> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }



  bool isRegistered = false;
  @override
  Widget build(BuildContext context) {
    if (!isRegistered){
      return const MaterialApp(
          home: LoginPage(),
      );
    }else{
      return const HomePage();
    }
  }
}



