
import 'package:edu_flex/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'joinroom.dart';
class CheckApp extends StatefulWidget {
  @override
  State<CheckApp> createState() => _CheckAppState();
}

class _CheckAppState extends State<CheckApp> {
  bool value=true;
  bool valu1= true;




  void displayMessage(){
    showDialog(context: context,  builder: (BuildContext context){
      AlertDialog dialog= AlertDialog(
        content: Text(
            "Teacher can Eneter this"
        ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          },  child: Text("Cancel")),
          ElevatedButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JoinRoom(),
              ),
            );

          }, child: Text('Ok'))
        ],
      );
      return dialog;
    });
  }
  void displayMessage1(){
    showDialog(context: context,  builder: (BuildContext context){
      AlertDialog dialog= AlertDialog(
        content: Text(
            "Students Can Login this"
        ),
        actions: [
          FlatButton(onPressed: (){
            Navigator.of(context).pop();
          },  child: Text("Cancel")),
          ElevatedButton(onPressed: (){

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen1(),
              ),
            );
          },  child: Text("OK"))
        ],
      );
      return dialog;
    });
  }
  @override
  Widget build(BuildContext context) {
/*    if (auth.currentUser != null ) {
      home = JoinRoom();
    }*/
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(

          title: Text(
              'Dashboard'
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,

          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.lightBlueAccent,Colors.purpleAccent]
                )
            ),


            child: Column(


              children: [
                Container(

                    margin: EdgeInsets.only(top: 30,right: 20),
                    child: Image.asset('assets/edu.png',height: 190,),

                ),
SizedBox(height: 39,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(

    children: [
      Padding(
        padding: EdgeInsets.all(30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Teachers',style: TextStyle(color: Colors.black,fontSize: 24),
              ),
              SizedBox(height: 30,),
              Container(
                  margin: EdgeInsets.only(top: 12,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                 /*     Checkbox(
                        value: valu1,
                        onChanged: (bool value){
                          setState(() {
                            this.valu1=value;
                          });
                        },
                      ),  */
                      Container(
                        height: 50.0,
                        margin: EdgeInsets.only(left: 4),
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => JoinRoom(),
                              ),
                            );
                          },
                          child: Text(
                              'Teachers Room'
                          ),
                        ),
                      )
                    ],
                  ),
              ),
     /*       Container(
                  margin: EdgeInsets.only(top: 32),
                  child: ElevatedButton(
                    child: Text("continue",style: TextStyle(color: Colors.white),),
                    onPressed: valu1 ? displayMessage : null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black
                    ),
                  ),
              )*/
            ],
        ),
      ),
      Padding(
        padding: EdgeInsets.all(32),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Students',style: TextStyle(color: Colors.black,fontSize: 24),
              ),
SizedBox(height: 30,),
              Container(
                  margin: EdgeInsets.only(top: 12,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                  /*    Checkbox(
                        value: value,
                        onChanged: (bool value){
                          setState(() {
                            this.value=value;
                          });
                        },
                      ),*/
                      Container(
                        height: 50.0,
                        margin: EdgeInsets.only(right: 37),
                        child: ElevatedButton(
                          onPressed: (){

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen1(),
                              ),
                            );
                          },
                          child: Text(
                              'Students Room'
                          ),
                        ),
                      )
                    ],
                  ),
              ),
    /*        Container(
                  margin: EdgeInsets.only(top: 32),
                  child: ElevatedButton(

                    child: Text("continue",style: TextStyle(color: Colors.white),),
                    onPressed: value ? displayMessage1 : null,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black
                    )
                  ),
              )*/
            ],
        ),
      ),
    ],
    ),
                )


              ],


        ),
          ),
      ),

    )
    );

  }
}