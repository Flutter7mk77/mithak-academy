import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_app/config/about_us.dart';
import 'package:flutter_ecommerce_app/config/contact_us.dart';
import 'package:flutter_ecommerce_app/config/singleCategoryPage.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/utilites/profil/colors.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin = false;
  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
      //  Navigator.of(context).pushReplacementNamed("start");
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
        !isloggedin
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/profil.png"),
                              fit: BoxFit.contain)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          getTranslated(context, "مرحبا بك في اكاديمية ميثاق"),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          //                               textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          //textDirection: TextDirection.rtl,
                        ),

                        Text(
                          getTranslated(context, "للتدريب و التسويق"),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          //                               textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "${user.displayName} ",

                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                          //                               textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // ignore: deprecated_member_use
                        OutlineButton(
                            color: Color(0xfff6c618),
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            onPressed: () {},
                            child: Text("${user.email}",
                                style: TextStyle(
                                    fontSize: 12,
                                    //letterSpacing: 2,
                                    color: ToolsUtilities.secondColor))),
                      ],
                    )
                  ],
                ),
              ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleCategoryPage(
                                  context: context,
                                  categoryName:
                                      ToolsUtilities.categoriesNames[2],
                                  icon: ToolsUtilities.categoriesIcons[2],
                                  indexCategory:
                                      ToolsUtilities.categoriesNames[2],
                                  categoryUrl: ToolsUtilities.categoriesUrls[2],
                                  index: 2)));
                    },
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.box,
                          color: black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          getTranslated(context, "مدربوا الأكاديمية"),
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.cog,
                      color: black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleCategoryPage(
                                    context: context,
                                    categoryName:
                                        ToolsUtilities.categoriesNames[4],
                                    icon: ToolsUtilities.categoriesIcons[4],
                                    indexCategory:
                                        ToolsUtilities.categoriesNames[4],
                                    categoryUrl:
                                        ToolsUtilities.categoriesUrls[4],
                                    index: 4)));
                      },
                      child: Text(
                        getTranslated(context, "الدورات"),
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingleCategoryPage(
                                    context: context,
                                    categoryName:
                                        ToolsUtilities.categoriesNames[7],
                                    icon: ToolsUtilities.categoriesIcons[7],
                                    indexCategory:
                                        ToolsUtilities.categoriesNames[7],
                                    categoryUrl:
                                        ToolsUtilities.categoriesUrls[7],
                                    index: 7)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "القاعة التدريبية"),
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: black.withOpacity(0.5),
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                                        ToolsUtilities.categoriesNames[1],
                                    icon: ToolsUtilities.categoriesIcons[1],
                                    indexCategory:
                                        ToolsUtilities.categoriesNames[1],
                                    categoryUrl:
                                        ToolsUtilities.categoriesUrls[1],
                                    index: 1)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "المعرض"),
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: black.withOpacity(0.5),
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
                            getTranslated(context, "عنا"),
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: black.withOpacity(0.5),
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SingleCategoryPage(
                                  context: context,
                                  categoryName:
                                      ToolsUtilities.categoriesNames[1],
                                  icon: ToolsUtilities.categoriesIcons[1],
                                  indexCategory:
                                      ToolsUtilities.categoriesNames[1],
                                  categoryUrl: ToolsUtilities.categoriesUrls[1],
                                  index: 1)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "المناسبات"),
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.info_outline_sharp,
                            color: black.withOpacity(0.5),
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            getTranslated(context, "الاشعارات"),
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(
                            Icons.notification_add_sharp,
                            color: black.withOpacity(0.5),
                            size: 17,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: grey.withOpacity(0.6),
                  )
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
