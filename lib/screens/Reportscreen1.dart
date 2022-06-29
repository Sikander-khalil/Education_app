import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/Dashboard2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../addnote.dart';
import '../editnote.dart';
import '../report.dart';
import 'HomeScreen.dart';

class ReportScreen1 extends StatefulWidget {
  const ReportScreen1({Key key}) : super(key: key);

  @override
  State<ReportScreen1> createState() => _ReportScreen1State();
}

class _ReportScreen1State extends State<ReportScreen1> {
  final Stream<QuerySnapshot> _usersStream =
  FirebaseFirestore.instance.collection('report').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   /*   floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 11, 133),
        onPressed: () {
          *//*Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => addnote()));*//*
        },
        child: Icon(
          Icons.add,
        ),
      ),*/
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Students',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Dasboard2()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: StreamBuilder(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (_, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            reportt(docid: snapshot.data.docs[index]),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3,
                          right: 3,
                        ),
                        child: Card(
                          color: Colors.red,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            title: Text(
                              snapshot.data.docChanges[index].doc['name'],
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            subtitle: Text("\nTotal marks  ${snapshot.data.docChanges[index].doc['totalmarks']}",style: TextStyle(color: Colors.white),),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
