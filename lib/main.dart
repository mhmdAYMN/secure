import 'package:flutter/material.dart';
import 'screens/welcome.dart';
import 'screens/login.dart';
import 'screens/chat.dart';
import 'screens/reg.dart';
import 'package:firebase_auth/firebase_auth.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute:welcome_screen.id ,
      // string ..... screen>>>>>
      routes: {
        welcome_screen.id:(context)=>welcome_screen(),
        login.id:(context)=>login(),
        regest.id:(context)=>regest(),
        chat.id:(context)=>chat(),
      },


    );
  }
}

