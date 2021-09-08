import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/config/sized_config.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page.dart';
//import 'package:flutter_ecommerce_app/home.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/home_screen.dart';
//import 'package:flutter_ecommerce_app/home.dart';
import 'package:flutter_ecommerce_app/style.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page.dart';

import 'package:flutter_ecommerce_app/utilites/discoverypage.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/home.dart';
import 'package:flutter_ecommerce_app/utilites/profil/account_page.dart';
import 'package:flutter_ecommerce_app/utilites/profil/homes.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/more_page.dart';
import 'package:flutter_ecommerce_app/utilites/profil/more_pages.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Stateful widget created
class BottomBar extends StatefulWidget {
  static String routeName = "/bottom";
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("/");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();

    final googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

// index given for tabs
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

// Number of tabs
  final tabs = [
    DiscoveryPage(),
    Homes(),
    AccountPage(),
    MorePages(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: !isloggedin
          ? Center(child: CircularProgressIndicator())
          : IndexedStack(
              index: currentIndex,
              children: tabs,
            ),

      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // button 1
              GestureDetector(
                onTap: () {
                  setBottomBarIndex(0);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: currentIndex == 0
                            ? AppColors.primaryLight
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/home.svg',
                          width: 18,
                          color: currentIndex == 0
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                        currentIndex == 0
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: PrimaryText(
                                    text: getTranslated(
                                        context, "الصفحة الرئسية"),
                                    size: 10,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700),
                              )
                            : SizedBox()
                      ],
                    )),
              ),

              // button 2
              GestureDetector(
                onTap: () {
                  setBottomBarIndex(1);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: currentIndex == 1
                            ? AppColors.primaryLight
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/location.svg',
                          width: 21,
                          color: currentIndex == 1
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                        currentIndex == 1
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: PrimaryText(
                                    text: getTranslated(context, "ميثاق"),
                                    size: 12,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700),
                              )
                            : SizedBox()
                      ],
                    )),
              ),
              // button 3
              GestureDetector(
                onTap: () {
                  setBottomBarIndex(2);
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                    decoration: BoxDecoration(
                        color: currentIndex == 2
                            ? AppColors.primaryLight
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/user.svg',
                          width: 19,
                          color: currentIndex == 2
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                        currentIndex == 2
                            ? Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: PrimaryText(
                                    text: getTranslated(context, "حساب"),
                                    size: 12,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700),
                              )
                            : SizedBox()
                      ],
                    )),
              ),

              // button 4
              GestureDetector(
                onTap: () {
                  setBottomBarIndex(3);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: currentIndex == 3
                            ? AppColors.primaryLight
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.more_horiz,
                          color: currentIndex == 3
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                        currentIndex == 3
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: PrimaryText(
                                    text: getTranslated(context, "الإعدادت"),
                                    size: 12,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700),
                              )
                            : SizedBox()
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
