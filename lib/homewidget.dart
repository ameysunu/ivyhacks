import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ivyhacks/home.dart';

class HomeWidgte extends StatefulWidget {
  @override
  _HomeWidgteState createState() => _HomeWidgteState();
}

class _HomeWidgteState extends State<HomeWidgte> {
  @override
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Home(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Hexcolor('#845EC2'),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'Home',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.local_hospital, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'Centers',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.chat, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'Chat',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.person_add, color: Hexcolor('#FFF6FF')),
              title: new Text(
                'Therapy',
                style: TextStyle(
                    color: Hexcolor('#FFF6FF'), fontFamily: 'Poppins'),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
