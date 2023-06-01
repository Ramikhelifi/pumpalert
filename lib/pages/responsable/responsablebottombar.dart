import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stapp/pages/registrefilles/registertype/registre.dart';
import 'package:stapp/pages/registrefilles/registertype/registre_type.dart';
import 'package:stapp/pages/responsable/alert.dart';
import 'package:stapp/pages/userinfo.dart';

class responsablebottombar extends StatefulWidget {
  const responsablebottombar({Key? key}) : super(key: key);

  @override
  State<responsablebottombar> createState() => _responsablebottombarState();
}

class _responsablebottombarState extends State<responsablebottombar> {
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
                  Icons.add_alert,
                  color: Colors.blue,
                ),
                label: 'Alert'),
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
