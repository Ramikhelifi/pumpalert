import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registre3 extends StatelessWidget {
  const registre3({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add3');
            // Handle button press
          },
          child: Icon(Icons.add),
        ),
      ),
      appBar: AppBar(
        title: Text('registre'),
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('register3').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('le nom de loperateur')),
                            DataColumn(label: Text('heure de debut')),
                            DataColumn(label: Text('heure de fin')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text(snapshot.data!.docs[index]
                                  ['operateur name'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['start'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['finish'])),
                            ]),
                          ],
                        ),
                      ),
                    )));
          } else {
            return Container();
          }
        },
      )),
    );
    // FloatingActionButton(
    //   onPressed: () {
    //     Navigator.pushNamed(context, 'name');
    //   },
    //   child: Icon(Icons.add),
    // )
  }
}
