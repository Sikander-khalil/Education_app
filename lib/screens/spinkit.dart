import 'dart:async';

import 'package:edu_flex/screens/quiz_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../views/Onboardingpage.dart';

class Spinkit extends StatefulWidget {
  const Spinkit({Key key}) : super(key: key);

  @override
  State<Spinkit> createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 5),
          () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Onboardingpage()),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.redAccent),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "   Loading....",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 25,
                ),
                SpinKitWave(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.white : Colors.green,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ));
  }
}