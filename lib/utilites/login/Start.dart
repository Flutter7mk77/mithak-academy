import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/bottomAppBar.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:google_sign_in/google_sign_in.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> googleSignIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (googleAuth.idToken != null && googleAuth.accessToken != null) {
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        final UserCredential user =
            await _auth.signInWithCredential(credential);

        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomBar()));

        return user;
      } else {
        throw StateError('Missing Google Auth Token');
      }
    } else
      throw StateError('Sign in Aborted');
  }

  navigateToLogin() async {
    Navigator.pushReplacementNamed(context, "Login");
  }

  navigateToRegister() async {
    Navigator.pushReplacementNamed(context, "SignUp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 120.0),
            Center(
              child: Container(
                height: 250,
                child: Image(
                  image: AssetImage("assets/19.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
              text: 'Welcome to مرحبا بكم ',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
            SizedBox(height: 10.0),
            Text(
              'أكاديمية ميثاق الدولية للتسويق و التدريب ',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    onPressed: navigateToLogin,
                    child: Text(
                      'LOGIN دخول',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xFF171C69)),
                SizedBox(width: 20.0),
                // ignore: deprecated_member_use
                RaisedButton(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: navigateToRegister,
                    child: Text(
                      'REGISTER تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xFF171C69)),
              ],
            ),
            SizedBox(height: 10.0),
            SignInButton(Buttons.Google,
                text: "Sign up with Google", onPressed: googleSignIn)
          ],
        ),
      ),
    );
  }
}
