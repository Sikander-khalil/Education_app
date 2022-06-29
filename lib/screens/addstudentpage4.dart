import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStudentPage4 extends StatefulWidget {
  const AddStudentPage4({Key key}) : super(key: key);

  @override
  State<AddStudentPage4> createState() => _AddStudentPage4State();
}

class _AddStudentPage4State extends State<AddStudentPage4> {
  final _formkey= GlobalKey<FormState>();
  var name2='';
  var email2='';
  var rollno2= '';

  final name2Controller = TextEditingController();
  final name3Controller = TextEditingController();
  final email2Controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    name2Controller.dispose();
    email2Controller.dispose();
    name3Controller.dispose();

    super.dispose();
  }
  clearText(){
    name2Controller.clear();
    email2Controller.clear();
    name3Controller.clear();

  }
  //Add Students
  CollectionReference students2= FirebaseFirestore.instance.collection('students1');
  Future<void> addUser(){
    return students2.add({
      'name2': name2, 'name3' : rollno2,
    }).then((value) => print("User Add")).catchError((error){
      print('Failed to add user: $error');
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Add Students"),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          child: ListView(
            children: [

              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Roll no',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.red,fontSize: 14),
                  ),
                  controller: name3Controller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter rollno';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Attendance',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.red,fontSize: 14),
                  ),
                  controller: name2Controller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter attendance';
                    }
                    return null;
                  },
                ),
              ),
SizedBox(height: 30,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      if(_formkey.currentState.validate()){
                        setState(() {
                          name2 = name2Controller.text;
                          email2 = email2Controller.text;
                          rollno2 =name3Controller.text;

                          addUser();
                          clearText();
                        });
                      }

                    }, child: Text('Register',style: TextStyle(fontSize: 10,color: Colors.white),),),
                    ElevatedButton(onPressed: () =>{
                      clearText()

                    }, child: Text('Reset',style: TextStyle(fontSize: 18),),
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
