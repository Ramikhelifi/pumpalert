import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoPage extends StatefulWidget {
  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String? email = '';
  String? first_name = '';
  String? last_name = '';
  String? phone = '';
  User? userId = FirebaseAuth.instance.currentUser;

  Future getdatafromdatabase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          email = snapshot.data()!["email"];
          first_name = snapshot.data()!["first_name"];
          last_name = snapshot.data()!["last_name"];
          phone = snapshot.data()!["phone"];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdatafromdatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Text('first name :' + first_name!),
              Text('last name :' + last_name!),
              Text('email :' + email!),
              Text('phone :' + phone!),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, 'whoru');
                  // Implement logout functionality here
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
