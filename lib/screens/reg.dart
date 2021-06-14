import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:secure/screens/chat.dart';
class regest extends StatefulWidget {
  static const String id='reg';
  @override
  _regestState createState() => _regestState();
}

class _regestState extends State<regest> {
  var _auth=FirebaseAuth.instance;
  String mail;
  String password;

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
            child: TextField(
              textAlign: TextAlign.center,

              onChanged: (v){
                mail=v;

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
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (v){
                password=v;


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
                onPressed: ()  async{
                  try {
                    //making new user :
                    final new_user = await _auth.createUserWithEmailAndPassword(
                        email: mail, password: password);
                    if (new_user!=null){
                      Navigator.pushNamed(context, chat.id);
                    }
                  }
                  catch(e){
                    print(e);
                  }



                },
                child: Text('Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700


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

















