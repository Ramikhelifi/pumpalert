import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/widgets/custombutton.dart';
import 'package:stapp/widgets/elevatedbutton.dart';

class responsable_registre extends StatelessWidget {
  responsable_registre({this.email, this.password});

  TextEditingController controllefirstname = TextEditingController();
  TextEditingController controllelastname = TextEditingController();
  TextEditingController controlleemail = TextEditingController();
  TextEditingController controllephone = TextEditingController();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.asset(
            'images/pumpalert.png',
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Form(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'first name',
                        hintText: 'first name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'last name',
                        hintText: 'last name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'email',
                        hintText: 'email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: 'tel',
                        hintText: 'tel',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.fingerprint),
                        labelText: 'password',
                        hintText: 'pasword',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.remove_red_eye_sharp),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
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
                            .createUserWithEmailAndPassword(
                                email: email!, password: password!);
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('The password provided is too weak.')),
                          );
                        } else if (ex.code == 'email-already-in-use') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'The account already exists for that email.')),
                          );
                        }
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('success')));
                      Map<String, dynamic> saveuserinfo = {
                        'first_name': controllefirstname.text,
                        'last_name': controllelastname.text,
                        'phone': controllephone.text,
                        'email': controlleemail.text,
                      };
                      FirebaseFirestore.instance
                          .collection('responsableinfo')
                          .add(saveuserinfo);
                    },
                    text: 'register'),
                SizedBox(height: 20),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'allready have an account ',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    GestureDetector(
                      onTap: (() {
                        Navigator.pushNamed(context, 'opererateur_login');
                      }),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
