import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpdateStudentPage5 extends StatefulWidget {
  final String id;
  const UpdateStudentPage5({Key key,this.id}) : super(key: key);

  @override
  State<UpdateStudentPage5> createState() => _UpdateStudentPage5State();
}

class _UpdateStudentPage5State extends State<UpdateStudentPage5> {
  CollectionReference students3= FirebaseFirestore.instance.collection('students2');
  final _formkey= GlobalKey<FormState>();
  Future<void> updateUser(id,name4,rollno3,password3){
    return students3.doc(id).update({
      'name7': name4, 'name6' : rollno3, 'password3' : password3
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

            future: FirebaseFirestore.instance.collection('students2').doc(widget.id).get(),
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
              var name4 = data['name7'];
              var rollno3 = data['name6'];
              var password3 = data['password3'];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        initialValue: rollno3,
                        autofocus: false,
                        onChanged: (value)=> rollno3 = value,
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
                        initialValue: name4,
                        autofocus: false,
                        onChanged: (value)=> name4 = value,
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
                        initialValue: password3,
                        autofocus: false,
                        obscureText: true,
                        onChanged: (value)=> password3 = value,
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
                              updateUser(widget.id,name4,rollno3,password3);
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
