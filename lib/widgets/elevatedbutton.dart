import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customelevatedbutton extends StatelessWidget {
  customelevatedbutton(
      {this.ontap, required this.onPressed, required this.text});
  VoidCallback? onPressed;
  VoidCallback? ontap;
  String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4.0,
      ),
    );
  }
}
