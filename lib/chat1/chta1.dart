
import 'package:edu_flex/chat1/Pages/LoginPage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegram Clone',
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: CHTHALoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
