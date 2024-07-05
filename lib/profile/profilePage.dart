import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('lib/images/picture.JPG'),
                  radius: 60.0,
                ),
                const Text(
                  'Saber Oyghan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Title: Professional',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSans3',
                      fontSize: 20.0,
                      color: Colors.white70),
                ),
                const SizedBox(
                  width: 300.0,
                  child: Divider(
                    color: Colors.white,
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 400,
                  width: 300,
                  child: Card(
                    color: Colors.black12,
                    child: Container(
                      margin: const EdgeInsetsDirectional.all(20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("Rating",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("Completed Sessions",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("Total Hours Study",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("Average Working Hours",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("Today Rating",style: TextStyle(fontSize: 20),)
                            ],
                          ),
                          SizedBox(
                            height: 350,
                            child: VerticalDivider(
                              color: Colors.white30,
                            ),
                          ),
                          Column(
                            children: [
                              Text("8.8",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("250",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("500",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("5",style: TextStyle(fontSize: 20),),
                              SizedBox(height: 10,),
                              Text("9.2",style: TextStyle(fontSize: 20),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
