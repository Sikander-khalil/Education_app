
import 'dart:io';
import 'dart:ui';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/chat/chathome.dart';








import 'package:edu_flex/joinroom.dart';
import 'package:edu_flex/pages/edit_profile.dart';
import 'package:edu_flex/pages/settings.dart';



import 'package:edu_flex/screens/studentshomepage.dart';



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';







import '../dash.dart';
import '../db/attdenace/homepage.dart';
import '../models/user_model.dart';




import '../task/list.dart';

import '../ui/_add_task_bar.dart';



import '../views/Onboardingpage.dart';

import 'AlertSms.dart';
import 'AnimatedSplash.dart';

import 'Register_screen.dart';
import 'ReportScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                   // Text("${loggedInUser.email}")
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
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.person), title: Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            SizedBox(height: 20,),
            ListTile(
              leading: Icon(Icons.app_registration), title: Text("Join Room",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => JoinRoom()));
              },
            ),
            SizedBox(height: 20,),

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
                      Text('Welcome to E-learning',style: TextStyle(color: Colors.white,fontSize: 20),)
                   //   Text('Welcome to ${loggedInUser.firstName} ${loggedInUser.secondName}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
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
                                MaterialPageRoute(builder: (context) => ListScreen()));



                          },
                        ),

                      /*  RowReusableCardButton(
                          tileColor: null,
                          icon: Icons.timer_rounded,
                          label: string.timetable,
                          onPressed: () {
                            kopenPage(context, UploadImage());
                          },
                        ),*/
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
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => StudentHomepage3()));
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
                                MaterialPageRoute(builder: (context) => AddTaskpage()));



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
                                MaterialPageRoute(builder: (context) => ReportScreen()));
                          },
                        ),

                        InkWell(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset('assets/phone.png',height: 120),
                                Text('SMS Throgh Phone',style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          onTap: (){

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) => AlertSms()));

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
                                MaterialPageRoute(builder: (context) => JoinRoom()));
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