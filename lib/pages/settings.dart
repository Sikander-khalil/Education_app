import 'package:app_settings/app_settings.dart';
import 'package:edu_flex/Dashboard2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/HomeScreen.dart';
import '../theme_model.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _switchvalue=true;
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
          return Scaffold(
            //   backgroundColor: _switchvalue ? Colors.white : Colors.black,
            appBar: AppBar(
title: Text('Setting Page',style: TextStyle(color: Colors.white),),
              actions: [
                IconButton(

                    onPressed: (){
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    },

                    icon:Icon(

                      themeNotifier.isDark
                          ? Icons.wb_sunny : Icons.nightlight_round,


                    ) )
              ],
              //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 9,
              leading: IconButton(
                onPressed: (){
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                icon: const Icon(Icons.arrow_back,
                  color: Colors.red,
                ),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
              child: ListView(
                children: [
                  const Text("Settings",style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Device Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 90),
                          child: IconButton(onPressed: (){
                            AppSettings.openDeviceSettings();

                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(height: 10,),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Bluetooth Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 65),
                          child: IconButton(onPressed: (){
                            AppSettings.openBluetoothSettings();

                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Location Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 75),
                          child: IconButton(onPressed: (){
                            AppSettings.openLocationSettings();

                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Notification Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 50),
                          child: IconButton(onPressed: (){

                            AppSettings.openNotificationSettings();
                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Date Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 109),
                          child: IconButton(onPressed: (){

                            AppSettings.openDateSettings();
                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Security Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 80),
                          child: IconButton(onPressed: (){
                            AppSettings.openSecuritySettings();

                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open display Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 89),
                          child: IconButton(onPressed: (){
                            AppSettings.openDisplaySettings();

                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children:  [
                      Container(

                        child: Text('Open Hotspot Settings',style: TextStyle(fontSize: 19),),

                      ),
                      Container(
                          margin: EdgeInsets.only(left: 80),
                          child: IconButton(onPressed: (){

                            AppSettings.openHotspotSettings();
                          }, icon: Icon(Icons.arrow_forward_ios))),
                      SizedBox(
                        width: 8,),

                    ],
                  ),

                ],
              ),
            ),
          );
        });
  }





}

