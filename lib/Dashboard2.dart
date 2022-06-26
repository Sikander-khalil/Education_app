
import 'dart:io';
import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:edu_flex/dash.dart';

import 'package:edu_flex/home1.dart';
import 'package:edu_flex/pages/edit_profile.dart';
import 'package:edu_flex/pages/settings.dart';
import 'package:edu_flex/screens/AlertSms.dart';
import 'package:edu_flex/screens/AnimatedSplash.dart';
import 'package:edu_flex/screens/Register_screen.dart';
import 'package:edu_flex/screens/ReportScreen.dart';
import 'package:edu_flex/screens/Reportscreen1.dart';
import 'package:edu_flex/screens/login_screen.dart';
import 'package:edu_flex/task/list.dart';
import 'package:edu_flex/task/stdentslist/ListSCreen1.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import '../models/user_model.dart';

import '../ui/_add_task_bar.dart';

import '../views/Onboardingpage.dart';
import 'AlertSms2.dart';
import 'EditProfilePage2.dart';
import 'Home5.dart';
import 'SettingsPage2.dart';

import 'db/attdenace/students_attendance/studenthome_page.dart';







class Dasboard2 extends StatefulWidget {
  @override
  _Dasboard2State createState() => _Dasboard2State();
}

class _Dasboard2State extends State<Dasboard2> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = new GlobalKey<ScaffoldState>();
  User user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  final picker = ImagePicker();
  File _image;
  Color image = Color(0xff125589);
  FirebaseAuth auth = FirebaseAuth.instance;
  void _pickImage() async {
    final pickedFile = await picker.getImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());

    });
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Edu flex',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(

              accountName: Container(
                width: 130,
                height: 130,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: _image != null
                      ? FileImage(_image)
                      : NetworkImage(
                      'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/boy_male_avatar_portrait-512.png'),
                ),

                margin: EdgeInsets.only(bottom: 10),
                //child: Text("${loggedInUser.firstName} ${loggedInUser.secondName}")
              ),

              accountEmail: Row(

                children: [
                  FlatButton.icon(
                      textColor: image,
                      icon: Icon(Icons.image),
                      label: Text('Add Image',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        _pickImage();
                      }),
             //     Text("${loggedInUser.email}")
                ],


              ),

            ),
            ListTile(
              leading: Icon(Icons.home), title: Text("Home",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              onTap: () {


                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => CheckApp()));
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.settings), title: Text("Settings",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SettingsPage2()));
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.person), title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EditProfilePage2()));
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.app_registration), title: Text("Signup",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => RegistrationScreen()));
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.phone), title: Text("SMS through phone",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AlertSms2()));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(

            height: size.height * 10,

            decoration: BoxDecoration(

                image: DecorationImage(

                  alignment: Alignment.topCenter,
                  image: Image.network(
                      "https://mars-metcdn-com.global.ssl.fastly.net/content/uploads/sites/101/2019/04/30162428/Top-Header-Background.png"
                  ).image,
                )
            ),
          ),

          SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  margin:  EdgeInsets.only(left: 310.0, top: 5 ),


                ),

                Container(
                  height: 62,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                   //   Text('Welcome to ${loggedInUser.firstName} ${loggedInUser.secondName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
                      Text('Welcome to E-learning',style: TextStyle(color: Colors.white,fontSize: 20),)
                    ],
                  ),
                ),


                SizedBox(height: 20,),
                Container(

                  child: Expanded(
                    child: GridView.count(

                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/TimeTable1.png',height: 120),
                                Text(' TimeTable',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => ListScreen1()));



                          },
                        ),
                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/attende.png',height: 120),
                                Divider(),
                                Text('Attandance',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          onTap: (){
                           setState(() {
                             Navigator.of(context).pushReplacement(
                                 MaterialPageRoute(builder: (context) => StudentHomepage2()));
                           });
                          },
                        ),
                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/events.png',height: 120),
                                Text(' Events',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => Home5()));



                          },
                        ),
                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/quiz.png',height: 120),
                                Divider(),
                                Text('Quiz',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => AnimatedSplash()));


                          },
                        ),
                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/report.png',height: 120),
                                Text('Reports',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          onTap: (){

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => ReportScreen1()));
                          },
                        ),
                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/logout.png',height: 120),

                                Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          onTap: (){

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => LoginScreen1()));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}