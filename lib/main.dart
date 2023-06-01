import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stapp/pages/cordinateur/cordinateurbottombar.dart';
import 'package:stapp/pages/registrefilles/registertype/add1.dart';
import 'package:stapp/pages/registrefilles/registertype/add1.dart';
import 'package:stapp/firebase_options.dart';
import 'package:stapp/dddddddd/login_page.dart';
import 'package:stapp/pages/cordinateur/registring_pages/cordinateu_login.dart';
import 'package:stapp/pages/cordinateur/registring_pages/cordinateur_register.dart';
import 'package:stapp/pages/operateur/operatorbottombar.dart';
import 'package:stapp/pages/registrefilles/registertype/add2.dart';
import 'package:stapp/pages/registrefilles/registertype/add3.dart';

import 'package:stapp/pages/registrefilles/registertype/registre.dart';
import 'package:stapp/dddddddd/registertype.dart';
import 'package:stapp/pages/operateur/registring_pages/operateur_login.dart';
import 'package:stapp/pages/operateur/registring_pages/operateur_registre.dart';
import 'package:stapp/pages/registrefilles/registertype/registre2.dart';
import 'package:stapp/pages/registrefilles/registertype/registre3.dart';
import 'package:stapp/pages/responsable/registring_pages/responsable_login.dart';
import 'package:stapp/pages/responsable/registring_pages/responsable_register.dart';
import 'package:stapp/pages/responsable/responsablebottombar.dart';
import 'package:stapp/pages/who_are_you.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(stapp());
}

class stapp extends StatelessWidget {
  const stapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'operateur_login': (context) => operateur_login(),
        'operateur_registre': (context) => operateur_registre(),
        'responsable_login': (context) => responsable_login(),
        'responsable_registre': (context) => responsable_registre(),
        'operatorbottombar': (context) => operatorbottombar(),
        'responsablebottombar': (context) => responsablebottombar(),
        'cordinateurbottombar': (context) => cordinateurbottombar(),
        'add1': (context) => add1(),
        'add2': (context) => add2(),
        'add3': (context) => add3(),
        'cordinateur_registre': (context) => cordinateur_registre(),
        'cordinateur_login': (context) => cordinateur_login(),
        'registre1': (context) => registre1(),
        'registre2': (context) => registre2(),
        'registre3': (context) => registre3(),
        'whoru': (context) => whoru(),
        'back1': (context) => registre1(),
        'back2': (context) => registre2(),
        'back3': (context) => registre3(),
      },
      home: whoru(),
    );
  }
}
