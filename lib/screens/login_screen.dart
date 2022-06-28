
import 'package:edu_flex/dash.dart';
import 'package:edu_flex/theme_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Dashboard2.dart';
import 'FadeAnimation.dart';
import 'HomeScreen.dart';
import 'Register_screen.dart';

/*final _lighttheme = ThemeData(
    brightness: Brightness.light,
    textTheme:TextTheme(
        bodyText2: TextStyle(
            color: Colors.black
        )
    )

);
final _darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme:TextTheme(
        bodyText2: TextStyle(
            color: Colors.white
        )
    )

);*/



class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key key}) : super(key: key);

  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  // form key
  final _formKey = GlobalKey<FormState>();
  final ThemeModel themeModel= ThemeModel();
  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
bool _passwordVisible ;
  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String errorMessage;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }
  @override
  Widget build(BuildContext context) {

    final emailField = TextFormField(
      style: TextStyle(color: Colors.red),
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("edu_flex+[a-zA-Z0-9+_.-]+[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          
          hintText: "Email",
          hintStyle: TextStyle(color: Colors.grey),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
      style: TextStyle(color: Colors.red),
        autofocus: false,
        controller: passwordController,
        obscureText:  !_passwordVisible,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
        },
        onSaved: (value) {
          passwordController.text = value;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.key,color: Colors.grey,),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              _passwordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },

          ),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          hintStyle: TextStyle(color: Colors.grey),


          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () {
            signIn(emailController.text, passwordController.text);
          },
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 120,
                        width: 150,
                        height: 250,
                        child: FadeAnimation(1, Container(

                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/edu.png')
                              )
                          ),
                        )),
                      ),
/*                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png')
                              )
                          ),
                        )),
                      ),*/
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: IconButton(onPressed: (){

                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CheckApp()));

                        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                          iconSize: 20,


                        ),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child:  Form (
    key: _formKey,
    child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
    Row(children: [
    // Text('dmkadmak')
    ],),

    SizedBox(
    height: 10,
    /* child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      )*/),
    SizedBox(height: 1),
    emailField,
    SizedBox(height: 25),
    passwordField,
    SizedBox(height: 35),
    loginButton,
    SizedBox(height: 15),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text("Don't have an account? ",style: TextStyle(color: Colors.grey),),
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    RegistrationScreen()));
    },
    child: Text(
    "SignUp",
    style: TextStyle(
    color: Colors.redAccent,
    fontWeight: FontWeight.bold,
    fontSize: 15),
    ),
    )
    ])
    ],
    ),
    ),
    ),
                    ],
                  ),
                )
    ),
              ],
            ),
          ),

      ]  )
    )
              )
    );
  }

  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Dasboard2())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage);
        print(error.code);
      }
    }
  }
}
