
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/HomeScreen.dart';
import 'addstudentpage3.dart';
import 'liststudent.dart';







class StudentHomepage3 extends StatefulWidget {
  const StudentHomepage3({Key key}) : super(key: key);

  @override
  State<StudentHomepage3> createState() => _StudentHomepage3State();
}

class _StudentHomepage3State extends State<StudentHomepage3> {
  @override
  Widget build(BuildContext context) {
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
            Text('Students list'),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> AddStudentPage3()));


            }, child: Text('Add',style: TextStyle(fontSize: 20),),

              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage3(),
    );
  }
}
