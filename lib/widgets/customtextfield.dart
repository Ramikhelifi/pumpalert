import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class customtextfield extends StatelessWidget {
  const customtextfield({required this.hinttext, required this.labeltext});
  final String hinttext;
  final String labeltext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.fingerprint),
        labelText: 'hinttext',
        hintText: 'Password',
        border: OutlineInputBorder(),
        suffixIcon: IconButton(
          onPressed: null,
          icon: Icon(Icons.remove_red_eye_sharp),
        ),
      ),
    );
  }
}
