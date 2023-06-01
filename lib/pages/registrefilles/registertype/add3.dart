import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/widgets/elevatedbutton.dart';

class add3 extends StatelessWidget {
  add3({Key? key}) : super(key: key);
  TextEditingController controllerworkername = TextEditingController();
  TextEditingController controllertimestart = TextEditingController();
  TextEditingController controllertimeend = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference registre =
        FirebaseFirestore.instance.collection('registre3');

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
                    Center(
                      child: Text('enter the pompeinformation'),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: controllerworkername,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.info),
                        labelText: 'operateur name',
                        hintText: 'operateur nom',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllertimestart,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        labelText: 'start',
                        hintText: 'start',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllertimeend,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.start),
                        labelText: 'finish',
                        hintText: 'finish',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'back3');
                      Map<String, dynamic> datatosave = {
                        'operateur name': controllerworkername.text,
                        'start': controllertimestart.text,
                        'finish': controllertimeend.text,
                      };
                      FirebaseFirestore.instance
                          .collection('register3')
                          .add(datatosave);
                    },
                    text: 'next'),
                SizedBox(height: 20),
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
