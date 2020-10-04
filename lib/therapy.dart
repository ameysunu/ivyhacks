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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "This pandemic, can be a little frustrating and you might have tons of stuff in your head right now. Get in touch with our best therapists.",
              style: TextStyle(fontFamily: 'Poppins', color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
