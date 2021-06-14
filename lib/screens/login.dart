import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure/screens/chat.dart';


class login extends StatefulWidget {
  static const String id='login';
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  var _auth=FirebaseAuth.instance;
  var email;
  var pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: Hero( tag: 'logo',
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 250.0,
              ),
            ),
          ),
          SizedBox(
            height: 45.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField( textAlign: TextAlign.center,
              onChanged: (v){
              email=v;

              },
                decoration: InputDecoration(
                  hintText: 'enter you mail',
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29.0)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(29.0)),
                  ),
                ),

            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (v){
                pass=v;

              },
              decoration: InputDecoration(
                hintText: 'enter your password',
                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(29.0)
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(29.0)),
                ),
              ),

            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Material(
              elevation: 4.0,
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () async{
                   var user=   await _auth.signInWithEmailAndPassword(email:email, password: pass);
                   if(user!=null){
                     Navigator.pushNamed(context,chat.id );
                   }
                },
                child: Text('login',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700


                  ),

                ),
              ),
            ),
          ),





        ],

      ),


    );
  }
}
