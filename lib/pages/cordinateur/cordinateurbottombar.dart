import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/pages/cordinateur/alertcordinateur.dart';
import 'package:stapp/pages/registrefilles/registertype/registre_type.dart';
import 'package:stapp/pages/userinfo.dart';

class cordinateurbottombar extends StatefulWidget {
  const cordinateurbottombar({Key? key}) : super(key: key);

  @override
  State<cordinateurbottombar> createState() => _cordinateurbottombarState();
}

class _cordinateurbottombarState extends State<cordinateurbottombar> {
  int selectindex = 0;
  void navigatbottombar(int index) {
    setState(() {
      selectindex = index;
    });
  }

  final List<Widget> page = [
    registre_type(),
    alertcordinateur(),
    UserInfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          currentIndex: selectindex,
          onTap: navigatbottombar,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.file_copy,
                  color: Colors.blue,
                ),
                label: 'file'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                  color: Colors.blue,
                ),
                label: 'alert'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_alert,
                  color: Colors.blue,
                ),
                label: 'profil'),
          ]),
      body: page[selectindex],
    );
  }
}
