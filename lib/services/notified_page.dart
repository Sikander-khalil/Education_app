import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class NotifiedPage extends StatelessWidget {
  final String label;
  const NotifiedPage({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Get.isDarkMode? Colors.grey[600]: Colors.white,
        leading: IconButton(

          onPressed: ()=> Get.back(),
          icon: Icon(Icons.arrow_back_ios),
          color: Get.isDarkMode?Colors.white: Colors.grey,
        ),
        title:  Text(this.label.toString().split("|")[0],style: TextStyle(color: Colors.black),),
      ),

body: Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Container(
    height: 100,
    width: 350,
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(20),
      color: Get.isDarkMode? Colors.white: Colors.grey[400]
    ),
    child:  Row(

        children: [
     Container(


         child:  IconButton(
             icon: Icon(Icons.notification_add_outlined,size: 30,),
             onPressed: () {}
         ),),
          Text(this.label.toString().split("|")[1],style: TextStyle(color: Colors.black),)
        ],
    ),




  ),
),
    );
  }
}
