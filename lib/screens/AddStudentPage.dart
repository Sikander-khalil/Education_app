import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  const AddStudentPage({Key key}) : super(key: key);

  @override
  State<AddStudentPage> createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formkey= GlobalKey<FormState>();
  var name='';
  var email='';
  var password='';
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
  clearText(){
    nameController.clear();
    emailController.clear();
    passController.clear();
  }
  //Add Students
  CollectionReference students= FirebaseFirestore.instance.collection('students');
  Future<void> addUser(){
    return students.add({
      'name': name, 'email' : email, 'password' : password
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
                    labelText: 'Name',
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
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color: Colors.red,fontSize: 14),
                  ),
                  controller: emailController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter email';
                    }else if(!value.contains('@')){
                      return 'Please Valid Email';
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
                  controller: passController,
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
                          name = nameController.text;
                          email = emailController.text;
                          password = passController.text;
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
