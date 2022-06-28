
import 'package:edu_flex/screens/attedance_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/HomeScreen.dart';
import 'addstudentpage4.dart';
import 'liststudentpage4.dart';








class ScienceAttendance extends StatefulWidget {
  const ScienceAttendance({Key key}) : super(key: key);

  @override
  State<ScienceAttendance> createState() => _ScienceAttendanceState();
}

class _ScienceAttendanceState extends State<ScienceAttendance> {
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage4()));


            }, child: Text('Add',style: TextStyle(fontSize: 20),),

              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage4(),
    );
  }
}
