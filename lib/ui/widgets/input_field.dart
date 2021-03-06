
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
class MyInputfield extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final Widget  widget;
  const MyInputfield({Key key,  this.title, this.hint, this.controller,this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
padding: EdgeInsets.only(top: 20),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(
            height: 52,
           margin: EdgeInsets.only(top: 8.0),
           padding: EdgeInsets.only(left: 14),
           decoration: BoxDecoration(
              border: Border.all(
               color:Colors.black,
                width: 5.0
              ),
             borderRadius: BorderRadius.circular(50)
            ),
            child:  Row(
              children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget==null?false:true,
             autofocus: false,
                  cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0
                      )
                    )
                  ),
                ) ,
              ),
                widget==null?Container():Container(child: widget)
              ]
            ),


          )
        ],
      ),


    );
  }
}
