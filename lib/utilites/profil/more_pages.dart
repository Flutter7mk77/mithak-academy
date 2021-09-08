import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/classes/language.dart';
import 'package:flutter_ecommerce_app/config/about_us.dart';
import 'package:flutter_ecommerce_app/config/contact_us.dart';

import 'package:flutter_ecommerce_app/config/singleCategoryPage.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/utilites/profil/colors.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'mithakd.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/constant.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MorePages extends StatefulWidget {
  @override
  _MorePagesState createState() => _MorePagesState();
}

class _MorePagesState extends State<MorePages> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("start");
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/200.jpg"),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    getTranslated(context, "بطاقة العضوية"),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    //                               textDirection: TextDirection.ltr,
                    // textAlign: TextAlign.center,
                  ),
                  Text(
                    getTranslated(context, "أكاديمية ميثاق"),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    //                               textDirection: TextDirection.ltr,
                    // textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF0E0D57),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ),
                            );
                          },
                          child: Text(
                            getTranslated(context, "عن الأكاديمية"),
                            style: TextStyle(fontSize: 13, color: white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleCategoryPage(
                                    context: context,
                                    categoryName:
                                        ToolsUtilities.categoriesNames[6],
                                    icon: ToolsUtilities.categoriesIcons[6],
                                    indexCategory:
                                        ToolsUtilities.categoriesNames[6],
                                    categoryUrl:
                                        ToolsUtilities.categoriesUrls[6],
                                    index: 6)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "الإنضمام"),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.person_add_outlined,
                            color: black.withOpacity(0.5),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleCategoryPage(
                                    context: context,
                                    categoryName:
                                        ToolsUtilities.categoriesNames[6],
                                    icon: ToolsUtilities.categoriesIcons[6],
                                    indexCategory:
                                        ToolsUtilities.categoriesNames[6],
                                    categoryUrl:
                                        ToolsUtilities.categoriesUrls[6],
                                    index: 6)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "طلب الإستشارة"),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.filter_sharp,
                            color: black.withOpacity(0.5),
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "تواصل معنا"),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.phone,
                            color: black.withOpacity(0.5),
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleCategoryPage(
                                    context: context,
                                    categoryName:
                                        ToolsUtilities.categoriesNames[3],
                                    icon: ToolsUtilities.categoriesIcons[3],
                                    indexCategory:
                                        ToolsUtilities.categoriesNames[3],
                                    categoryUrl:
                                        ToolsUtilities.categoriesUrls[3],
                                    index: 3)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "المقالات"),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.next_week_sharp,
                            color: black.withOpacity(0.5),
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "الاشعارات"),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.notification_add_sharp,
                            color: black.withOpacity(0.5),
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<Language>(
                          iconSize: 20,
                          hint: Text(
                            getTranslated(context, "تغير اللغة"),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onChanged: (Language language) {
                            _changeLanguage(language);
                          },
                          items: Language.languageList()
                              .map<DropdownMenuItem<Language>>(
                                (e) => DropdownMenuItem<Language>(
                                  value: e,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        e.flag,
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      Text(e.name)
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        // ignore: deprecated_member_use
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // ignore: deprecated_member_use
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ignore: deprecated_member_use
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                            color: Color(0xFF27186A),
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: signOut,
                            child: Text(getTranslated(context, "تسجيل الخروج"),
                                style: TextStyle(
                                    fontSize: 16,
                                    //letterSpacing: 2,
                                    color: Colors.white))),
                      ),
                      // ignore: deprecated_member_use
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: deprecated_member_use
                        child: OutlineButton(
                            color: Color(0xfff6c618),
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              "assets/123.svg",
                              fit: BoxFit.fill,
                              width: 40,
                              height: 30,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
