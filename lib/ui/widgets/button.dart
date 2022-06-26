import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Button  extends StatelessWidget {
  final String label;
  final Function ()  onTap;
  const Button ({Key key,  this.label,  this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 30,
        margin: EdgeInsets.only(left: 140),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.red
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
