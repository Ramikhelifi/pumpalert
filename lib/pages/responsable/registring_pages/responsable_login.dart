import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/widgets/custombutton.dart';
import 'package:stapp/widgets/elevatedbutton.dart';

class responsable_login extends StatefulWidget {
  responsable_login({Key? key}) : super(key: key);

  @override
  State<responsable_login> createState() => _responsable_loginState();
}

class _responsable_loginState extends State<responsable_login> {
  String? email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.asset(
          'images/pumpalert.png',
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Column(
              children: [
                Text(
                  'hello again!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Welcome back , missing you!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: ((data) {
                    email = data;
                  }),
                  // controller: email_controller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: 'Email',
                      hintText: 'Email',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (data) {
                    password = data;
                  },
                  // controller: password_controller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_outlined),
                      labelText: 'password',
                      hintText: 'password',
                      border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customelevatedbutton(
                  onPressed: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email!, password: password!);
                      Navigator.pushNamed(context, 'responsablebottombar');
                    } on FirebaseAuthException catch (ex) {
                      if (ex.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('No user found for that email.')),
                        );
                      } else if (ex.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Wrong password provided for that user.')),
                        );
                      }
                    }
                  },
                  text: ('login')),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'dont have an account? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushNamed(context, 'responsable_registre');
                    }),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ));
  }
}
