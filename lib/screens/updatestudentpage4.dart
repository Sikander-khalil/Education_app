import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateStudentPage4 extends StatefulWidget {
  final String id;
  const UpdateStudentPage4({Key key,this.id}) : super(key: key);

  @override
  State<UpdateStudentPage4> createState() => _UpdateStudentPage4State();
}

class _UpdateStudentPage4State extends State<UpdateStudentPage4> {
  CollectionReference students2= FirebaseFirestore.instance.collection('students1');
  final _formkey= GlobalKey<FormState>();
  Future<void> updateUser(id,name2,rollno2,password2){
    return students2.doc(id).update({
      'name2': name2, 'name3' : rollno2, 'password2' : password2
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

            future: FirebaseFirestore.instance.collection('students1').doc(widget.id).get(),
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
              var name2 = data['name2'];
              var rollno2 = data['name3'];
              var password2 = data['password2'];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        initialValue: rollno2,
                        autofocus: false,
                        onChanged: (value)=> rollno2 = value,
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
                        initialValue: name2,
                        autofocus: false,
                        onChanged: (value)=> name2 = value,
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
                        initialValue: password2,
                        autofocus: false,
                        obscureText: true,
                        onChanged: (value)=> password2 = value,
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
                              updateUser(widget.id,name2,rollno2,password2);
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
