import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'reg.dart';
class welcome_screen extends StatefulWidget {
  static const String id='welcome_screen';
  @override
  _welcome_screenState createState() => _welcome_screenState();
}
class _welcome_screenState extends State<welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             Hero(
               tag: 'logo',
               child: Container(
                 child: Image.asset('images/logo.png'),
                 height: 60.0,
               ),
             ),
              Text('Secure_',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight:FontWeight.w800

              ),)
            ],


          ),
          SizedBox(
            height: 45.0,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
           child: Material(
             color: Colors.lightBlueAccent,
             borderRadius: BorderRadius.circular(30.0),
             elevation: 5.0,
             child: MaterialButton(
               onPressed:() {
                 Navigator.pushNamed(context, login.id);
               },
               child: Text('Login',
                 style: TextStyle(
                   fontSize: 20.0,
                   color:Colors.white,
                 ),

               ),
             ),


           ),



          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
              elevation: 5.0,
              child: MaterialButton(
                onPressed:() {
                  Navigator.pushNamed(context, regest.id);
                },
                child: Text('Register',
                  style: TextStyle(
                    fontSize: 20.0,
                    color:Colors.white,
                  ),

                ),
              ),


            ),



          )



        ],

      ),






    );
  }
}


