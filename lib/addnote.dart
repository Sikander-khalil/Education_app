import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/screens/ReportScreen.dart';

import 'package:flutter/material.dart';

import 'main.dart';

class addnote extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController subject1 = TextEditingController();
  TextEditingController subject2 = TextEditingController();
  TextEditingController subject3 = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('report');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:Colors.blue,
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ReportScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(right: 150),
              child: Text(
                "Back",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              ref.add({
                'name': name.text,
                'Maths': subject1.text,
                'Science': subject2.text,
                'History': subject3.text
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ReportScreen()));
              });
            },
            child: Text(
              "Save",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color:Colors.grey,
                        width: 4.0
                    ),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color:Colors.grey,
                        width: 4.0
                    ),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    controller: subject1,
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter the subjects Marks',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color:Colors.grey,
                        width: 4.0
                    ),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    controller: subject2,
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter the second subjects marks',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color:Colors.grey,
                        width: 4.0
                    ),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
                    controller: subject3,
                    maxLines: null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter the third Subjects',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}