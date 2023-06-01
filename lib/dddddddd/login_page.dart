import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/widgets/custombutton.dart';
import 'package:stapp/widgets/customtextfield.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  //textcontroller
  final email_controller = TextEditingController();
  final password_controller = TextEditingController();

  Future Signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email_controller.text.trim(),
      password: password_controller.text.trim(),
    );
  }

  @override
  void dispose() {
    email_controller.dispose();
    password_controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        // Image.asset(
        //   'images/logo.jpeg',
        // ),
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
                  controller: email_controller,
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
                  controller: password_controller,
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
              CustomButton(ontap: Signin, bttext: 'LOGIN'),
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
                      Navigator.pushNamed(context, 'register_page');
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
