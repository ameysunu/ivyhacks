import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ivyhacks/login.dart';

final firestoreInstance = FirebaseFirestore.instance;
Future<DocumentSnapshot> getUserInfo() async {
  var firebaseUser = await FirebaseAuth.instance.currentUser;
  return await FirebaseFirestore.instance.doc('users/booking').get();
}

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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              color: Hexcolor('#FFE9E2'),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                          backgroundColor: Hexcolor('#FFE9E2'),
                          child: Image.network(imageUrl)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            name,
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            email,
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 15),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 0,
            color: Hexcolor('#FFC75F'),
            child: Container(
              child: FutureBuilder(
                future: getUserInfo(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(
                              "Name:\n" +
                                  snapshot.data.data()['name'] +
                                  "\n\nAge:\n" +
                                  snapshot.data.data()['age'] +
                                  "\n\nDate:\n" +
                                  snapshot.data.data()['date'] +
                                  "\n\nHospital:\n" +
                                  snapshot.data.data()['hospital'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Poppins',
                                  fontSize: 16),
                            ),
                          );
                        });
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Text("No data");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
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
