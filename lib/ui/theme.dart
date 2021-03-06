import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



const Color bluishClr= Color(0xFF4e5ae8);
const Color yellowClr= Color(0xFFFFB746);
const Color pinkClr= Color(0xFFff4667);
const Color white= Colors.white;
const primaryClr= bluishClr;
const Color darkGreyClr= Color(0xFF121212);
const darkHeaderClr=Color(0xFF424242);

class Themes{
  static final light= ThemeData(
  backgroundColor: Colors.white ,
  primaryColor: primaryClr,
  brightness: Brightness.light,
      textTheme: TextTheme(
bodyText2: TextStyle(
color: Colors.black
)
      )
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
  primaryColor: darkGreyClr,
  brightness: Brightness.dark
  );
}


/*TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
  textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold
  )
  );
}*/
