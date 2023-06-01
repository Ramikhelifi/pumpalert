import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stapp/widgets/elevatedbutton.dart';

class add2 extends StatelessWidget {
  add2({Key? key}) : super(key: key);
  TextEditingController controllerdate = TextEditingController();
  TextEditingController controlleactiveancien = TextEditingController();
  TextEditingController controlleactivenouveau = TextEditingController();
  TextEditingController controllerdeffactive = TextEditingController();
  TextEditingController controllereactiveancien = TextEditingController();
  TextEditingController controllereactivenouveau = TextEditingController();
  TextEditingController controllerdeffreactive = TextEditingController();
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
                      controller: controllerdate,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.info),
                        labelText: 'date',
                        hintText: 'date',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controlleactiveancien,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        labelText: 'active ancien',
                        hintText: 'active ancien',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controlleactivenouveau,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.start),
                        labelText: 'active nouveau',
                        hintText: 'active nouveau',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerdeffactive,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        labelText: 'deffactive',
                        hintText: 'deffactive',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllereactiveancien,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timeline),
                        labelText: 'reactiveancien',
                        hintText: 'reactiveancien',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllereactivenouveau,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timeline),
                        labelText: 'reactivenouveau',
                        hintText: 'reactivenouveau',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: controllerdeffreactive,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.timeline),
                        labelText: 'deffreactive',
                        hintText: 'deffreactive',
                        border: OutlineInputBorder(),
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
                      Navigator.popAndPushNamed(context, 'back2');
                      Map<String, dynamic> datatosave = {
                        'date': controllerdate.text,
                        'active ancien': controlleactiveancien.text,
                        'active nouveau': controlleactivenouveau.text,
                        'active deff': controllerdeffactive.text,
                        'reactive ancien': controllereactiveancien.text,
                        'reactive nouveau': controllereactivenouveau.text,
                        'reactive deff': controllerdeffreactive.text,
                      };
                      FirebaseFirestore.instance
                          .collection('register2')
                          .add(datatosave);
                    },
                    text: 'next'),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
