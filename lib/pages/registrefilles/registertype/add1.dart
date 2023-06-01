import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/widgets/elevatedbutton.dart';

class add1 extends StatelessWidget {
  add1({Key? key}) : super(key: key);
  TextEditingController controllerpompenumber = TextEditingController();
  TextEditingController controllerworkername = TextEditingController();
  TextEditingController controllertimestart = TextEditingController();
  TextEditingController controllertimeend = TextEditingController();
  TextEditingController controlertemp = TextEditingController();
  TextEditingController controllerdebit = TextEditingController();
  TextEditingController controllervolume = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference registre =
        FirebaseFirestore.instance.collection('registre');

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
                        labelText: 'worker name',
                        hintText: 'worker name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerpompenumber,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        labelText: 'pompe number',
                        hintText: 'pompe number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllertimestart,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.start),
                        labelText: 'start',
                        hintText: 'start',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllertimeend,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        labelText: 'finish',
                        hintText: 'finish',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controlertemp,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timeline),
                        labelText: 'temp',
                        hintText: 'temp',
                        border: OutlineInputBorder(),
                        // suffixIcon: IconButton(
                        //   onPressed: null,
                        //   // icon: Icon(Icons.remove_red_eye_sharp),
                        // ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerdebit,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timeline),
                        labelText: 'debit',
                        hintText: 'debit',
                        border: OutlineInputBorder(),
                        // suffixIcon: IconButton(
                        //   onPressed: null,
                        //   // icon: Icon(Icons.remove_red_eye_sharp),
                        // ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllervolume,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timeline),
                        labelText: 'volume',
                        hintText: 'volume',
                        border: OutlineInputBorder(),
                        // suffixIcon: IconButton(
                        //   onPressed: null,
                        //   // icon: Icon(Icons.remove_red_eye_sharp),
                        // ),
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
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'back1');
                      Map<String, dynamic> datatosave = {
                        'worker name': controllerworkername.text,
                        'pompe number': controllerpompenumber.text,
                        'start': controllertimestart.text,
                        'finish': controllertimeend.text,
                        'temp': controlertemp.text,
                        'debit': controllerdebit.text,
                        'volume': controllervolume.text,
                      };
                      FirebaseFirestore.instance
                          .collection('register1')
                          .add(datatosave);
                    },
                    text: 'next'),
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
