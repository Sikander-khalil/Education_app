
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/screens/updatestudentpage4.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ListStudentPage4 extends StatefulWidget {
  const ListStudentPage4({Key key}) : super(key: key);

  @override
  State<ListStudentPage4> createState() => _ListStudentPage4State();
}

class _ListStudentPage4State extends State<ListStudentPage4> {
  final Stream<QuerySnapshot> studentsstreams= FirebaseFirestore.instance.collection('students1').snapshots();
  CollectionReference students2= FirebaseFirestore.instance.collection('students1');
  Future<void> deleteUser(id){
    // print("User Deleted $id");
    return students2.doc(id).delete().then((value) => print("User Deleted")).catchError((error){
      print('Failed to delete user: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: studentsstreams,builder:(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(snapshot.hasError){
        print("Something went wrong");
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),
        );
      }

      final List storedocs=[];
      snapshot.data.docs.map((DocumentSnapshot documentSnapshot) {
        Map a= documentSnapshot.data() as Map<String,dynamic>;
        storedocs.add(a);
        a['id'] = documentSnapshot.id;
      }).toList();

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Table(
            border: TableBorder.all(),
            columnWidths: const <int, TableColumnWidth>{
              1: FixedColumnWidth(140),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(

                  children: [
                    TableCell(child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Roll no',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),

                    ),),
                    TableCell(child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Attdance',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),

                    )),
                    TableCell(child: Container(
                      color: Colors.greenAccent,
                      child: Center(
                        child: Text(
                          'Action',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),

                    )),
                  ]
              ),
              for(var i =0; i< storedocs.length; i++) ...[
                TableRow(

                    children: [
                      TableCell(child: Center(
                        child: Text(
                          storedocs[i]['name3'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      ),),
                      TableCell(child: Center(
                        child: Text(
                          storedocs[i]['name2'],style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                        ),
                      )),

                      TableCell(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateStudentPage4(
                                id: storedocs[i]['id'])

                            ));

                          }, icon: Icon(Icons.edit,color: Colors.orange,)

                          ),
                          IconButton(onPressed: ()=> {
                            //print(storedocs)
                            deleteUser(storedocs[i]['id'])
                          }, icon: Icon(Icons.delete,color: Colors.red,))
                        ],

                      )),
                    ]
                ),
              ]
            ],
          ),
        ),

      );
    });



  }
}
