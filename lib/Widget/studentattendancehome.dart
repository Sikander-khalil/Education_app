
import 'dart:io';
import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/Dashboard2.dart';
import 'package:edu_flex/Widget/studenthistory.dart';
import 'package:edu_flex/Widget/studentscience.dart';




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../db/attdenace/students_attendance/studenthome_page.dart';













class Studentattendancehome extends StatefulWidget {
  @override
  _StudentattendancehomeState createState() => _StudentattendancehomeState();
}

class _StudentattendancehomeState extends State<Studentattendancehome> {








  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects Attendance'),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Dasboard2()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.red,)),

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
                                MaterialPageRoute(builder: (context) => StudentHomepage2()));
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
                                MaterialPageRoute(builder: (context) => StudentScience()));
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
                                MaterialPageRoute(builder: (context) => StudentHistory()));
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