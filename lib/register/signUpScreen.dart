import 'package:flutter/material.dart';
import 'package:pomoapp/register/loginScreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final userName = TextEditingController();
  final emailAddress = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  bool isSecure = true;
  //
  // final formKey = GlobalKey();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: 300,
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Hero(
                          tag: "logo",

                          child: SizedBox(
                            height: 100,
                              child: Image(image: AssetImage('lib/images/logo_1.png'),)),),
                        Hero(
                          tag: 'appname',
                          child: TweenAnimationBuilder<double>(
                            duration: const Duration(seconds: 7), // Set the desired duration for the animation
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (BuildContext context, double value, Widget? child) {
                              return Opacity(
                                opacity: value,
                                child: const Text(
                                  "Pomo",
                                  style: TextStyle(fontSize: 60),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),

                    const Divider(
                      height: 50,
                      color: Colors.teal,
                      thickness: 3,
                    ),
                    TextFormField(
                      controller: userName,
                        decoration: const InputDecoration(
                            hintText: "User Name",
                            icon: Icon(Icons.account_box_rounded)
                        ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Username can't be empty!";
                        }
                        return null;
                      },
                      ),
                    TextFormField(
                      controller: emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Email Address",
                          icon: Icon(Icons.email),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Email can't be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: password,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password can't be empty!";
                        }
                        return null;
                      },
                      obscureText: isSecure,
                      decoration: InputDecoration(
                          hintText: "Password",
                          icon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                if(isSecure){
                                  isSecure = false;
                                }
                                else{
                                  isSecure = true;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                      ),
                    ),
                    TextFormField(
                      controller: confirmPassword,
                      validator: (value){
                        if(value!.isEmpty){
                          return "This field cant be empty!";
                        }
                        if(password.text!=confirmPassword.text){
                          return "Password doesn't match!";
                        }
                        return null;
                      },
                      obscureText: isSecure,
                      decoration: InputDecoration(
                          hintText: "Confirm Password",
                          icon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                if(isSecure){
                                  isSecure = false;
                                }
                                else{
                                  isSecure = true;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: SizedBox(
                        width: 300,
                        child: Hero(
                          tag: "buttonSignUp",
                          child: TextButton(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                //     login
                                }
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.teal)),
                              child: const Text('Submit',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account! "),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
                            },
                            child: const Text("Sign In"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
