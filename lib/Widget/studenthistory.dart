
import 'package:edu_flex/Widget/studentattendancehome.dart';
import 'package:edu_flex/Widget/studentlistpage1.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';









class StudentHistory extends StatefulWidget {
  const StudentHistory({Key key}) : super(key: key);

  @override
  State<StudentHistory> createState() => _StudentHistoryState();
}

class _StudentHistoryState extends State<StudentHistory> {
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
      body: StudentListPage1(),
    );
  }
}
