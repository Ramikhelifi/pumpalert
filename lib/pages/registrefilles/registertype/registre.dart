import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registre1 extends StatelessWidget {
  const registre1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add1');
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
        stream: FirebaseFirestore.instance.collection('register1').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('POMPE')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('START')),
                            DataColumn(label: Text('FINISH')),
                            DataColumn(label: Text('TEMP')),
                            DataColumn(label: Text('DEBIT')),
                            DataColumn(label: Text('VOLUME')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text(
                                  snapshot.data!.docs[index]['pompe number'])),
                              DataCell(Text(
                                  snapshot.data!.docs[index]['worker name'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['start'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['finish'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['temp'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['debit'])),
                              DataCell(
                                  Text(snapshot.data!.docs[index]['volume'])),
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
