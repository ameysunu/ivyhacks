import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "COVID Care",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(child: Image.asset("images/login.png")),
          Text(
            "Login",
            style: TextStyle(
                color: Colors.black, fontFamily: 'Poppins', fontSize: 25),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "By signing, you would be accepting all Google's terms and conditions",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
