
import 'package:edu_flex/screens/addstudentpage5.dart';
import 'package:edu_flex/screens/attedance_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/HomeScreen.dart';
import 'addstudentpage4.dart';
import 'liststudentpage4.dart';
import 'liststudentpage5.dart';








class HistoryAttendance extends StatefulWidget {
  const HistoryAttendance({Key key}) : super(key: key);

  @override
  State<HistoryAttendance> createState() => _HistoryAttendanceState();
}

class _HistoryAttendanceState extends State<HistoryAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Attendancepage()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.red,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Students list'),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage5()));


            }, child: Text('Add',style: TextStyle(fontSize: 20),),

              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage5(),
    );
  }
}
