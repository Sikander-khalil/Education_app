import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStudentPage5 extends StatefulWidget {
  const AddStudentPage5({Key key}) : super(key: key);

  @override
  State<AddStudentPage5> createState() => _AddStudentPage5State();
}

class _AddStudentPage5State extends State<AddStudentPage5> {
  final _formkey= GlobalKey<FormState>();
  var name4='';
  var email3='';
  var rollno3= '';
  var password3='';
  final name4Controller = TextEditingController();
  final name5Controller = TextEditingController();
  final email3Controller = TextEditingController();
  final pass3Controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    name4Controller.dispose();
    email3Controller.dispose();
    name5Controller.dispose();
    pass3Controller.dispose();
    super.dispose();
  }
  clearText(){
    name4Controller.clear();
    email3Controller.clear();
    name5Controller.clear();
    pass3Controller.clear();
  }
  //Add Students
  CollectionReference students3= FirebaseFirestore.instance.collection('students2');
  Future<void> addUser(){
    return students3.add({
      'name7': name4, 'name6' : rollno3, 'password3' : password3
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
                  controller: name5Controller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter roll no';
                    }
                    return null;
                  },
                ),
              ),
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
                  controller: name4Controller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter name';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',

                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.red,fontSize: 14),
                  ),
                  controller: pass3Controller,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter password';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      if(_formkey.currentState.validate()){
                        setState(() {
                          name4 = name4Controller.text;
                          email3 = email3Controller.text;
                          rollno3 =name5Controller.text;
                          password3 = pass3Controller.text;
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
