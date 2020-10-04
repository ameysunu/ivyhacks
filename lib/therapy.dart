import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Therapy extends StatefulWidget {
  @override
  _TherapyState createState() => _TherapyState();
}

class _TherapyState extends State<Therapy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Hexcolor('#DCB0FF'),
        automaticallyImplyLeading: false,
        title: Text(
          "Therapy",
          style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
        ),
      ),
      backgroundColor: Hexcolor('#DCB0FF'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "This pandemic, can be a little frustrating and you might have tons of stuff in your head right now. Get in touch with our best therapists.",
                style: TextStyle(fontFamily: 'Poppins', color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Available Therapists",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    color: Hexcolor('#4C4452')),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            width: 250,
                            child: Card(
                              color: Hexcolor('#FFBD95'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Image.network(
                                  "https://i.ibb.co/pwd7tyv/femaleava.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              "Norma Warren",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 10),
                            child: Text(
                              "Gestalt-Therapy | 7 years",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 10, right: 10),
                            child: SizedBox(
                              height: 150,
                              width: 250,
                              child: Text(
                                "Norma is a graduate from John Hopkins and has been working as a therapist since 2013. She would help you resolve any sorts of depression, stress,isolation and any such oppressed issue.",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            width: 250,
                            child: Card(
                              color: Hexcolor('#FFACC0'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Image.network(
                                  "https://i.ibb.co/cvSfmqD/toppng-com-jpg-freeuse-library-user-computer-software-flat-man-user-flat-2610x2864.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              "John Stinson",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 10),
                            child: Text(
                              "Mental Health | 2 years",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 10, right: 10),
                            child: SizedBox(
                              height: 150,
                              width: 250,
                              child: Text(
                                "John is an extraordinary graduate from University of Mental Sciences and is in the field since 2018. He would help you talk out your anxiety, fear and any such mental factors.",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 300,
                            width: 250,
                            child: Card(
                              color: Hexcolor('#F9F871'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Image.network(
                                  "https://i.ibb.co/ky2dZhS/wamen.png"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              "Anna Stephens",
                              style: TextStyle(
                                  fontFamily: 'Poppins', fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 10),
                            child: Text(
                              "Psychiatrist | 4 years",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 10, right: 10),
                            child: SizedBox(
                              height: 150,
                              width: 250,
                              child: Text(
                                "Anna is also a graduate from John Hopkins and a brilliant psychiatrist. She would help you resolve any sorts of mental stress, recommend psychotherapies to relax.",
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
