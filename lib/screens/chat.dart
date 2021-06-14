import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
var sender ;

class chat extends StatefulWidget {
  static const String id='chat';
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
    //Widget list_name = new List<Widget>();

final c =TextEditingController();

  String msg;
  List<Widget> my_list=[];

  final  _auth=FirebaseAuth.instance;
  final   cloud=Firestore.instance;





  FirebaseUser loggedin;
  void getcuurentuser() async{
    try{
      final user= await  _auth.currentUser();
      if(user!=null){
        loggedin=user;
        print(user.email);


      }
    }
    catch(e){
      print(e);
    }
  }
@override
  void initState() {

    getcuurentuser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold( //backgroundColor: Colors.blueGrey,

      appBar: AppBar(


        backgroundColor: Colors.lightBlue,
        title: Text(
          'secure',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
         ),
        ),
        elevation: 4.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: (){
              //stream();
              _auth.signOut();
              Navigator.pop(context);

            },
          )
        ],

      ),
      body: SafeArea(

        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            StreamBuilder<QuerySnapshot>(

                stream: cloud.collection('message').orderBy('time', descending: true).snapshots(),
                builder: (context,snapshot){
                  if(!snapshot.hasData){
                    return Center(
                      child: Text('no data yet'),
                    );

                  }
                  List<M> msglist=[];
                  cloud.collection('message').orderBy('time',  descending: true);
                  var masseges=snapshot.data.documents;



                  for(var message in masseges){

                    var text=message.data['text'];
                    sender =message.data['sender'];

                    Widget msgwid=M(mytext: text, mymail: sender,login: loggedin.email,);


                    msglist.add(msgwid);
                  }

                  return Expanded(

                    child: ListView(

                      reverse: true,
                      children: msglist,
                    ),
                  );
                }

            ),
            ////////////////**///////////////////
            Container( //color: Colors.white,
             child:Column(

               crossAxisAlignment: CrossAxisAlignment.stretch,
               //mainAxisAlignment: MainAxisAlignment.start,

               children: <Widget>[
                 Divider(
                   color: Colors.lightBlueAccent,
                   thickness: 2.0,
                 ),
                 Row(
                   children: <Widget>[
                     Expanded(

                       child: TextField(
                         controller: c,
                           onChanged: (x){
                             msg=x;

                           },
                           decoration:  InputDecoration(

                             hintText: 'Type your messege here... ',
                             border: InputBorder.none,
                             contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                           )
                       ),
                       flex: 5,

                     ),
                     Expanded(
                         child: IconButton(
                           onPressed: (){

                             cloud.collection('message').add({
                               'text' :msg,
                               'sender' : loggedin.email,
                               'time'  : Timestamp.now().toString() ,



                             });

                             c.clear();


                           },
                           icon: Icon(Icons.send,
                             color: Colors.blue,
                             size: 28.0,
                           ),
                         )
                     )
                   ],
                 ),
               ],
             )

            ),




          ],






        ),
      ),

    );
  }
}
////////////////**/////////////**///////////////**/////
//// UI fot text ::::
class M extends StatelessWidget {
  String mytext;
  String mymail;
  String login;
  var mycolor=Colors.blueGrey;
  var t_c=Colors.black;
  var place=CrossAxisAlignment.end;
  var corner =BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),topLeft: Radius.circular(30.0));
  M(  {this.mytext,this.mymail,this.login});

  @override
  Widget build(BuildContext context) {
    if (mymail==login){
        mycolor=Colors.blue;
        place=CrossAxisAlignment.start;
        t_c=Colors.white;
        corner=BorderRadius.only(bottomRight: Radius.circular(30.0),topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0));

    }

    return Padding(
      padding: EdgeInsets.all(20.0),
     child: Column(
       crossAxisAlignment: place,
       children: <Widget>[
         Text('$mymail',
         style: TextStyle(
           fontSize: 15.0,
           color: Colors.black26,
         ),
         ),
         Material( 
           borderRadius: corner,
           color: mycolor,
           child:Padding(
             padding: EdgeInsets.all(15.0),
             child: Text('$mytext',
               style: TextStyle(
                 fontSize: 15.0,
                 color: t_c,
                 fontWeight: FontWeight.w600,
               ),
             ),
           )

         )
       ],
     ),
    );
  }}



