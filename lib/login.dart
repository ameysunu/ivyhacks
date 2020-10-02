import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ivyhacks/homewidget.dart';

String name;
String email;
String imageUrl;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);
    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}

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
        backgroundColor: Hexcolor('#FFFFFF'),
        title: Text(
          "COVID Care",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
      ),
      backgroundColor: Hexcolor('#FFFFFF'),
      body: Column(
        children: [
          SizedBox(child: Image.asset("images/login.png")),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Login",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "By signing, you would be accepting all Google's terms and conditions",
              style: TextStyle(
                  color: Colors.black, fontFamily: 'Poppins', fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                        height: 15,
                        width: 15,
                        child: Image.asset('images/google.png')),
                  ),
                  Text(
                    "Sign-in with Google",
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                  ),
                ],
              ),
              onPressed: () {
                signInWithGoogle().then((result) {
                  if (result != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return HomeWidgte();
                        },
                      ),
                    );
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
