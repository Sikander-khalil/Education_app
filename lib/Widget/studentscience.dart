
import 'package:edu_flex/Widget/studentattendancehome.dart';
import 'package:edu_flex/Widget/studentlistpage.dart';
import 'package:edu_flex/screens/attedance_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/HomeScreen.dart';









class StudentScience extends StatefulWidget {
  const StudentScience({Key key}) : super(key: key);

  @override
  State<StudentScience> createState() => _StudentScienceState();
}

class _StudentScienceState extends State<StudentScience> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Studentattendancehome()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.red,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Students list'),

          ],
        ),
      ),
      body: Studentslistpage(),
    );
  }
}
