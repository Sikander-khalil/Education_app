
import 'package:edu_flex/dash.dart';
import 'package:edu_flex/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';





class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final _formKey = GlobalKey<FormState>();

  var randomId = TextEditingController();
  var roomId;
  int randomRoomID;
  Color background = Colors.redAccent;
  Color button = Color(0xffeeeeee);

  void generateRoomId() {
    Random random = new Random();
    setState(() {
      randomId.text = random.nextInt(99999).toString();
    });
  }



  void submit() async {
    final valid = _formKey.currentState.validate();

    if (valid) {
      _formKey.currentState.save();
      print(roomId);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('room', roomId);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: AppBar(

        title: Text('Join Room'),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => CheckApp()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.white,)),
        elevation: 0,
        backgroundColor: Colors.grey,
        centerTitle: true,

        actions: [

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/icon.png'),
                ),
                SizedBox(width: 10),
                Text(
                  'Secure Room',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              width: 250,
              height: 250,
              child: Card(
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Join Room',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: randomId,
                          key: ValueKey('roomId'),
                          validator: (value) {
                            if (value.length < 5 || value.length > 5) {
                              return 'Please enter 5 digit room ID';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            roomId = value;
                          },
                          onChanged: (value) {
                            roomId = value;
                          },
                          keyboardType: TextInputType.number,
                          decoration:
                          InputDecoration(hintText: 'Enter Room ID'),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
/*                        RaisedButton(
                          onPressed: () {
                            generateRoomId();
                          },
                          elevation: 5,
                          child: Text(
                            'Generate',
                            style: TextStyle(color: Colors.black),
                          ),
                          color: button,
                        ),*/
                        FlatButton(
                            onPressed: () {
                              submit();
                            },
                            color: background,
                            child: Text(
                              'Join',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}