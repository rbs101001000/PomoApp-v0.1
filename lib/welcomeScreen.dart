import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomoapp/register/loginScreen.dart';
import 'package:pomoapp/register/signUpScreen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  String id = "welcomeScreen";

  void navigateLogin(){
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
        
          body: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Hero(
                        tag: 'logo',
                        child: Image(image: AssetImage('lib/images/logo_1.png'),width: 100,),),
                      Hero(
                          tag: 'appname',
                          child: Text("Pomo", style: TextStyle(fontSize: 40),)),],
                  ),
            
                  const Divider(
                    height: 50,
                    thickness: 3,
                  ),
                  SizedBox(
                    width: 200,
                    child: Hero(
                      tag: "buttonLogin",
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));},
                        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.teal)),
                        child: const Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Hero(
                      tag: "buttonSignUp",
                      child: TextButton(
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));},
                        style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.teal),),
                        child: const Text("Sign Up", style: TextStyle(fontSize: 20,color: Colors.white),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}