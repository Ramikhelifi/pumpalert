import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class registre2 extends StatelessWidget {
  const registre2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, 'add2');
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
        stream: FirebaseFirestore.instance.collection('register2').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('date')),
                            DataColumn(label: Text('ancien active')),
                            DataColumn(label: Text('nouveau active')),
                            DataColumn(label: Text('deffactive')),
                            DataColumn(label: Text('acient reactive')),
                            DataColumn(label: Text('nouveau reactive')),
                            DataColumn(label: Text('deffreactive')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                  Text(snapshot.data!.docs[index]['date'])),
                              DataCell(Text(
                                  snapshot.data!.docs[index]['active ancien'])),
                              DataCell(Text(snapshot.data!.docs[index]
                                  ['active nouveau'])),
                              DataCell(Text(
                                  snapshot.data!.docs[index]['active deff'])),
                              DataCell(Text(snapshot.data!.docs[index]
                                  ['reactive ancien'])),
                              DataCell(Text(snapshot.data!.docs[index]
                                  ['reactive nouveau'])),
                              DataCell(Text(
                                  snapshot.data!.docs[index]['reactive deff'])),
                            ]),
                          ],
                        ),
                      ),
                    )));
          } else {
            return Container(
              child: Text('there is no data'),
            );
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
