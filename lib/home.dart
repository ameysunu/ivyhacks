import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ivyhacks/login.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hexcolor('#D65DB1'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Hexcolor('#D65DB1'),
        title: Text(
          "Welcome $name",
          style: TextStyle(color: Colors.white, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
