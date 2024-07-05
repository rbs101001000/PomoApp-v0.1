import 'package:flutter/material.dart';
import 'package:pomoapp/home/homePage.dart';
import 'package:pomoapp/register/signUpScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String id = 'loginScreen';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailAddress = TextEditingController();
  final password = TextEditingController();
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Hero(
                      tag: "logo",
                      child: Image(image: AssetImage("lib/images/logo_1.png"),),),
                  Hero(
                    tag: 'appname',
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(seconds: 4), // Set the desired duration for the animation
                      tween: Tween<double>(begin: 0, end: 1),
                      builder: (BuildContext context, double value, Widget? child) {
                        return Opacity(
                          opacity: value,
                          child: const Text(
                            "Pomo",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(
                    height: 50,
                    thickness: 3,
                    color: Colors.teal,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Email Address",
                        icon: Icon(Icons.email),
                    ),
                  ),
                  TextFormField(
                    obscureText: isSecure,
                    decoration: InputDecoration(
                        hintText: "Password",
                        icon: const Icon(Icons.lock),
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            if(isSecure){
                              isSecure=false;
                            }
                            else{
                              isSecure = true;
                            }
                          });
                        }, icon: Icon(Icons.remove_red_eye))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(10),
                    child: SizedBox(
                      width: 300,
                      child: Hero(
                        tag: "buttonLogin",
                        child: TextButton(
                          style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.teal)),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                            },
                            child: const Text('Submit',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have any account! "),
                      TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));
                          },
                          child: const Text("Sign Up"))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}