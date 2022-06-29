import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/screens/ReportScreen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';
import 'report.dart';

class editnote extends StatefulWidget {
  DocumentSnapshot docid;
  editnote({ this.docid});

  @override
  _editnoteState createState() => _editnoteState(docid: docid);
}

class _editnoteState extends State<editnote> {
  DocumentSnapshot docid;
  _editnoteState({ this.docid});
  TextEditingController name = TextEditingController();
  TextEditingController subject1 = TextEditingController();
  TextEditingController subject2 = TextEditingController();
  TextEditingController subject3 = TextEditingController();
  TextEditingController totalmarks = TextEditingController();

  @override
  void initState() {
    name = TextEditingController(text: widget.docid.get('name'));
    subject1 = TextEditingController(text: widget.docid.get('Maths'));
    subject2 = TextEditingController(text: widget.docid.get('Science'));
    subject3 = TextEditingController(text: widget.docid.get('History'));
    totalmarks = TextEditingController(text: widget.docid.get('totalmarks'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ReportScreen()));
            },
            child:  Container(
              margin: EdgeInsets.only(right: 100),
              child: Text(
                "Back",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.update({
                'name': name.text,
                'Maths': subject1.text,
                'Science': subject2.text,
                'History': subject3.text,
                'totalmarks': totalmarks.text
              }).whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ReportScreen()));
              });
            },
            child:  Container(

              child: Text(
                "save",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              widget.docid.reference.delete().whenComplete(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => ReportScreen()));
              });
            },
            child: const Text(
              "delete",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(19.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:Colors.grey,
                          width: 5.0
                      ),
                      borderRadius: BorderRadius.circular(19)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.0),
                    child: TextField(
                      controller: name,
                      decoration:  InputDecoration(
                        hintText: 'name',
                      ),
                    ),
                  ),
                ),
              ),
               SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:Colors.grey,
                          width: 5.0
                      ),
                      borderRadius: BorderRadius.circular(19)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: subject1,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Maths',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:Colors.grey,
                          width: 5.0
                      ),
                      borderRadius: BorderRadius.circular(19)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: subject2,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Science',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:Colors.grey,
                          width: 5.0
                      ),
                      borderRadius: BorderRadius.circular(19)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: subject3,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'History',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color:Colors.grey,
                          width: 5.0
                      ),
                      borderRadius: BorderRadius.circular(19)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: totalmarks,
                      maxLines: null,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'totalmarks',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: const Color.fromARGB(255, 0, 11, 133),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => reportt(
                        docid: docid,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Make Report",
                  style: const TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 251, 251, 251),
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