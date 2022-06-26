import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_flex/chtha2/pages/home_page.dart';



import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../chat1/Widgets/ProgressWidget.dart';
import '../../screens/HomeScreen.dart';




class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool isLoggedIn=false;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    isSignedIn();
  }
  void isSignedIn()async{
    this.setState(() {
      isLoggedIn=true;

    });
    preferences = await SharedPreferences.getInstance();

    isLoggedIn = await googleSignIn.isSignedIn();

    if(isLoggedIn){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    this.setState(() {
      isLoading = false;

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with google'),
        automaticallyImplyLeading: false,
        leading: new IconButton(onPressed:(){

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));

        }, icon: new Icon(Icons.arrow_back_ios,color: Colors.red,)),
      ),
      body: Container(


        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlueAccent,Colors.purpleAccent]
            )
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Telegram Clone',style: TextStyle(fontSize: 82.0,color: Colors.white),
            ),
            GestureDetector(
              onTap: controlSignIn,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 270.0,
                      height: 65.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/google_signin_button.png'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.0),
                      child: isLoading? circularProgress() : Container(),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),

    );
  }


  Future<Null> controlSignIn() async {
    preferences = await SharedPreferences.getInstance();
    this.setState(() {


      isLoading = true;

    });
    GoogleSignInAccount googleSignInAccount= await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,accessToken: googleSignInAuthentication.accessToken);
    User firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;
//Signin Suceess

    if(firebaseUser != null){
// Check if already Signup
      final QuerySnapshot resultQuery = await FirebaseFirestore.instance.collection("users").where("id" , isEqualTo: firebaseUser.uid).get();
      final List<DocumentSnapshot> documentsnapshot= resultQuery.docs;

//Save Data to firestore - if new user

      if(documentsnapshot.length == 0){
        FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
          "nickname" : firebaseUser.displayName,
          "photoUrl" : firebaseUser.photoURL,
          "id" : firebaseUser.uid,
          "aboutMe" : "I am using roti",
          "createdAt" : DateTime.now().millisecondsSinceEpoch.toString(),

        });

//Write Data to Local

        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("nickname", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoURL);
      }
      else{
        await preferences.setString("id", documentsnapshot[0]["id"]);
        await preferences.setString("nickname", documentsnapshot[0]["nickname"]);
        await preferences.setString("photoUrl", documentsnapshot[0]["photoUrl"]);
        await preferences.setString("aboutMe", documentsnapshot[0]["aboutMe"]);

      }
      Fluttertoast.showToast(msg: "Congratulation, Sign in Success");
      this.setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
// Signin Failed
    else{
      Fluttertoast.showToast(msg: "Try Again, Sign in Failed");
      this.setState(() {
        isLoading = false;
      });
    }
  }
}














/*


import 'package:edu_flex/chtha2/constants/app_constants.dart';
import 'package:edu_flex/chtha2/constants/color_constants.dart';
import 'package:edu_flex/chtha2/pages/home_page.dart';
import 'package:edu_flex/chtha2/providers/providers.dart';
import 'package:edu_flex/chtha2/widgets/loading_view.dart';
import 'package:edu_flex/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(AppConstants.loginTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          centerTitle: true,
          leading: new IconButton(onPressed:(){

            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeScreen()));

          }, icon: new Icon(Icons.arrow_back_ios,color: Colors.black,)),

        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: TextButton(
                onPressed: () async {
                  bool isSuccess = await authProvider.handleSignIn();
                  if (isSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) return Color(0xffdd4b39).withOpacity(0.8);
                      return Color(0xffdd4b39);
                    },
                  ),
                  splashFactory: NoSplash.splashFactory,
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.fromLTRB(30, 15, 30, 15),
                  ),
                ),
              ),
            ),
            // Loading
            Positioned(
              child: authProvider.status == Status.authenticating ? LoadingView() : SizedBox.shrink(),
            ),
          ],
        ));
  }
}
*/
