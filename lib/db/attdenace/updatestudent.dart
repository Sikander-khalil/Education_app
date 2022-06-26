import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateStudentPage3 extends StatefulWidget {
  final String id;
  const UpdateStudentPage3({Key key,this.id}) : super(key: key);

  @override
  State<UpdateStudentPage3> createState() => _UpdateStudentPage3State();
}

class _UpdateStudentPage3State extends State<UpdateStudentPage3> {
  CollectionReference students= FirebaseFirestore.instance.collection('students');
  final _formkey= GlobalKey<FormState>();
  Future<void> updateUser(id,name,rollno,password){
    return students.doc(id).update({
      'name': name, 'name1' : rollno, 'password' : password
    }).then((value) => print("User Update")).catchError((error){
      print('Failed to Update user: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Students'),
      ),
      body: Form(
          key: _formkey,
          child: FutureBuilder<DocumentSnapshot <Map <String,dynamic>>>(

            future: FirebaseFirestore.instance.collection('students').doc(widget.id).get(),
            builder: (_,snapshot){
              if(snapshot.hasError){
                print('Something Went Wrong');
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              var data =snapshot.data.data();
              var name = data['name'];
              var rollno = data['name1'];
              var password = data['password'];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        initialValue: rollno,
                        autofocus: false,
                        onChanged: (value)=> rollno = value,
                        decoration: InputDecoration(
                            labelText: 'Roll no',
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter roll no';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        initialValue: name,
                        autofocus: false,
                        onChanged: (value)=> name = value,
                        decoration: InputDecoration(
                            labelText: 'Attendance',
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        initialValue: password,
                        autofocus: false,
                        obscureText: true,
                        onChanged: (value)=> password = value,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(fontSize: 20),
                            border: OutlineInputBorder(),
                            errorStyle: TextStyle(color: Colors.redAccent,fontSize: 15)
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter Password';
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
                            if(_formkey.currentState.validate())  {
                              updateUser(widget.id,name,rollno,password);
                              Navigator.pop(context);
                            }

                          }, child: Text('Update',style: TextStyle(fontSize: 10,color: Colors.white),),),

                          ElevatedButton(onPressed: () =>{}, child: Text('Reset',style: TextStyle(fontSize: 18.0),),
                            style: ElevatedButton.styleFrom(primary: Colors.blueGrey),

                          )

                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )


      ),
    );
  }
}
