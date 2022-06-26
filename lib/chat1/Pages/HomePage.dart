import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/chat1/chta1.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';


class HomeScreen1 extends StatefulWidget {
  final String cuurentUserId;
  HomeScreen1({Key key, @required this.cuurentUserId}) : super(key: key);

  @override
  State createState() => HomeScreen1State();
}

class HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
return RaisedButton.icon(onPressed: logoutUser, icon: Icon(Icons.close), label: Text("Sign out"));
  }
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<Null> logoutUser()async{
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyApp()), (Route<dynamic> route) => false);
  }
}



class UserResult extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

  }
}
