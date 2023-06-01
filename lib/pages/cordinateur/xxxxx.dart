import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/dddddddd/homtdhgdx.dart';
import 'package:stapp/pages/registrefilles/registertype/add1.dart';

import 'package:stapp/dddddddd/login_page.dart';
import 'package:stapp/pages/registrefilles/registertype/registre.dart';
import 'package:stapp/pages/registrefilles/registertype/registre_type.dart';
import 'package:stapp/pages/responsable/alert.dart';
import 'package:stapp/pages/userinfo.dart';

class operatorbottombar extends StatefulWidget {
  const operatorbottombar({Key? key}) : super(key: key);

  @override
  State<operatorbottombar> createState() => _operatorbottombarState();
}

class _operatorbottombarState extends State<operatorbottombar> {
  int selectindex = 0;
  void navigatbottombar(int index) {
    setState(() {
      selectindex = index;
    });
  }

  final List<Widget> page = [
    registre_type(),
    alert(),
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
                label: 'register'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                label: 'profil'),
          ]),
      body: page[selectindex],
    );
  }
}
