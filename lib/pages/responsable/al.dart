import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context) {
  TextEditingController controllertitle = TextEditingController();
  TextEditingController controllercontent = TextEditingController();
  String title = '';
  String content = '';
  CollectionReference alert = FirebaseFirestore.instance.collection('alert');

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: controllertitle,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: controllercontent,
              decoration: InputDecoration(labelText: 'Content'),
              onChanged: (value) {
                content = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Map<String, dynamic> datatosave = {
                'title': controllertitle.text,
                'content': controllercontent.text,
              };
              FirebaseFirestore.instance.collection('alert').add(datatosave);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
