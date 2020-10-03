import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';

final firestoreInstance = FirebaseFirestore.instance;

class Bookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Listview',
      debugShowCheckedModeBanner: false,
      home: MyList(),
    );
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#FFC75F'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor('#FFC75F'),
        title: Text(
          "Bookings",
          style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) return new Text('${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));
                  if (!snapshot.hasData) return Text('No data found!');
                  return SingleChildScrollView(
                    child: Column(
                        children:
                            snapshot.data.docs.map((DocumentSnapshot document) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Text(
                          "Name: " +
                              document['name'] +
                              "\nAge: " +
                              document['age'] +
                              "\nDate: " +
                              document['date'] +
                              "\nHospital: " +
                              document['hospital'],
                          style: TextStyle(fontFamily: 'Poppins', fontSize: 15),
                        ),
                      );
                    }).toList()),
                  );
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Delete Booking",
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                ],
              ),
              onPressed: () {
                deleteRecord();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bookings()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void deleteRecord() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  firestoreInstance
      .collection("users")
      .doc('booking')
      .update({"name": "", "age": "", "date": "", "hospital": ""}).then((_) {
    print("success!");
  });
}
