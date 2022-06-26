import 'package:edu_flex/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child){
      return Scaffold(
        appBar: AppBar(
          title: Text(themeNotifier.isDark ? "Dark Theme" : "Light Theme"),
          actions: [
            IconButton(onPressed: (){
              themeNotifier.isDark
                  ? themeNotifier.isDark = false
                  : themeNotifier.isDark = true;
            },

                icon:Icon(
                  themeNotifier.isDark
                      ? Icons.wb_sunny : Icons.nightlight_round
                ) )
          ],
        ),
      );
    });
  }
}

