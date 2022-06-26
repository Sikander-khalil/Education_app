
import 'package:edu_flex/Dashboard2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../liststudent.dart';
import 'list_studentpage2.dart';









class StudentHomepage2 extends StatefulWidget {
  const StudentHomepage2({Key key}) : super(key: key);

  @override
  State<StudentHomepage2> createState() => _StudentHomepage3State();
}

class _StudentHomepage3State extends State<StudentHomepage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Dasboard2()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.red,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Students list'),
          /*  ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage3()));


            }, child: Text('Add',style: TextStyle(fontSize: 20),),

              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )*/
          ],
        ),
      ),
      body: ListStudentPage2(),
    );
  }
}
