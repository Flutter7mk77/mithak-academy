//import 'package:authentification/pages/button_widget.dart';
//import 'package:authentification/pages/navigation_drawer_widget.dart';
//import 'package:authentification/pages/navigation_drawer_widget.dart';
//,import 'package:authentification/pages/starterPage.dart';
//import 'package:authentification/Start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/utilites/login/button_widget.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    // this.checkAuthentication();
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Welcome'),
            content: Center(
              child: Text(
                ' مرحبا بك  في أكاديميت ميثاق للحصول على شهادة العضوية ستقوم الإدراة بي تواصل معك وشكرا   ',
                textDirection: TextDirection.rtl,
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(getTranslated(context, "بتوفيق")))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: Builder(
          builder: (context) => AlertDialog(
            title: Text('Welcome أهلا بك'),
            content: Text(
              "مرحبا بك  في أكاديميت ميثاق للحصول على شهادة العضوية ستقوم الإدراة بي تواصل معك وشكرا ",
              textDirection: TextDirection.rtl,
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ButtonWidget(
                            onClicked: () {
                              // Scaffold.of(context)
                              //.openDrawer(); // Scaffold.of(context).openEndDrawer();
                            },
                          ),
                        ));
                  },
                  child: ButtonWidget(
                    text: Text(
                      getTranslated(context, "بتوفيق"),
                      style: TextStyle(fontSize: 50.0),
                    ),
                    onClicked: () {
                      //  Scaffold.of(context)
                      //.openDrawer(); // Scaffold.of(context).openEndDrawer();
                    },
                  ))
            ],
          ),
        ),
      ),
    ]);
  }
}
