import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onpressed, this.ontap, required this.bttext});
  VoidCallback? ontap;
  VoidCallback? onpressed;
  String bttext;
  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color.fromARGB(255, 183, 14, 14);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 60),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Color.fromARGB(255, 251, 250, 250),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Text(
          bttext,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
