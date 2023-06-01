import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registre_type extends StatelessWidget {
  const registre_type({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choose the register you want'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'registre1');
              },
              child: Text('registre de consultation'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, 'registre de consomation delectricite');
              },
              child: Text('registre2'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'registre de presence');
              },
              child: Text('registre3'),
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
