
import 'dart:io';
import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/chat/chathome.dart';
import 'package:edu_flex/db/attdenace/homepage.dart';








import 'package:edu_flex/joinroom.dart';
import 'package:edu_flex/pages/edit_profile.dart';
import 'package:edu_flex/pages/settings.dart';
import 'package:edu_flex/screens/HomeScreen.dart';
import 'package:edu_flex/screens/attedance_home.dart';
import 'package:edu_flex/screens/science_attednace.dart';



import 'package:edu_flex/screens/studentshomepage.dart';




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'History_attendance.dart';













class Attendancepage extends StatefulWidget {
  @override
  _AttendancepageState createState() => _AttendancepageState();
}

class _AttendancepageState extends State<Attendancepage> {








  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.red,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Attendance Subjects'),
            /*  ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage3()));


            }, child: Text('Add',style: TextStyle(fontSize: 20),),

              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )*/
          ],
        ),
      ),

      body: Stack(
        children: <Widget>[
          Container(

            height: size.height * 10,


          ),

          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin:  EdgeInsets.only(left: 310.0, top: 5 ),


                ),




                SizedBox(height: 20,),
                Container(

                  child: Expanded(
                    child: GridView.count(

                      crossAxisCount: 1,
                      children: <Widget>[










                        InkWell(
                          child: Card(
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[


                                Text('Math Attendance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                              ],
                            ),
                          ),
                          onTap: (){

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => StudentHomepage3()));
                          },
                        ),
                        InkWell(
                          child: Card(
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[


                                Text('Science Attendance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                              ],
                            ),
                          ),
                          onTap: (){

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => ScienceAttendance()));
                          },
                        ),
                        InkWell(
                          child: Card(
                            color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[


                                Text('History Attendance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
                              ],
                            ),
                          ),
                          onTap: (){

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => HistoryAttendance()));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}