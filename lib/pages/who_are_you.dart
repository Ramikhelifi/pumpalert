import 'package:flutter/material.dart';
import 'package:stapp/widgets/elevatedbutton.dart';

class whoru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Choose Option'),
          ),
          body: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      'choisir ton role',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customelevatedbutton(
                      text: "operateur",
                      onPressed: () {
                        Navigator.pushNamed(context, 'operateur_login');
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customelevatedbutton(
                      text: "responsable",
                      onPressed: () {
                        Navigator.pushNamed(context, 'responsable_login');
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    customelevatedbutton(
                      text: "cordinateur",
                      onPressed: () {
                        Navigator.pushNamed(context, 'cordinateur_login');
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
