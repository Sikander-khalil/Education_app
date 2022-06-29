import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStudentPage3 extends StatefulWidget {
  const AddStudentPage3({Key key}) : super(key: key);

  @override
  State<AddStudentPage3> createState() => _AddStudentPage3State();
}

class _AddStudentPage3State extends State<AddStudentPage3> {
  final _formkey= GlobalKey<FormState>();
  var name='';
  var email='';
  var rollno= '';

  final nameController = TextEditingController();
  final name1Controller = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    name1Controller.dispose();

    super.dispose();
  }
  clearText(){
    nameController.clear();
    emailController.clear();
    name1Controller.clear();

  }
  //Add Students
  CollectionReference students= FirebaseFirestore.instance.collection('students');
  Future<void> addUser(){
    return students.add({
      'name': name, 'name1' : rollno,
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
                  controller: name1Controller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter roll no';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10,),
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
                  controller: nameController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter name';
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
                          name = nameController.text;
                          email = emailController.text;
                          rollno =name1Controller.text;

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
