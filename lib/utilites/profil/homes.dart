import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/config/cars_slider.dart';
import 'package:flutter_ecommerce_app/config/singleCategoryPage.dart';
import 'package:flutter_ecommerce_app/config/sized_config.dart';
//import 'package:flutter_ecommerce_app/constants.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/home_screen.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page_json.dart';
import 'package:flutter_ecommerce_app/homepgs/styles.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
//import 'package:flutter_ecommerce_app/main.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/home_screen.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/body.dart';
//import 'package:flutter_ecommerce_app/productDetail.dart';
import 'package:flutter_ecommerce_app/style.dart';
import 'package:flutter_ecommerce_app/utilites/profil/academy.dart';
import 'package:flutter_ecommerce_app/utilites/profil/colors.dart';
import 'package:flutter_ecommerce_app/utilites/profil/mithk.dart';
import 'package:flutter_ecommerce_app/utilites/profil/national.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
//import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
//import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
//simport 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

//import 'package:flutter_ecommerce_app/utilites/profil/constant.dart';
// 'package:flutter_svg/svg.dart';
class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  bool showSpinner = true;
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: ListView(
          children: [
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                            color: Color(0xFF27186A),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SingleCategoryPage(
                                          context: context,
                                          categoryName:
                                              ToolsUtilities.categoriesNames[0],
                                          icon:
                                              ToolsUtilities.categoriesIcons[0],
                                          indexCategory:
                                              ToolsUtilities.categoriesNames[0],
                                          categoryUrl:
                                              ToolsUtilities.categoriesUrls[0],
                                          index: 0)));
                            },
                            child: Text(getTranslated(context, "المعرض"),
                                style: TextStyle(
                                    fontSize: 12,
                                    //letterSpacing: 2,
                                    color: Colors.white))),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 8),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          color: Color(0xFF27186A),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleCategoryPage(
                                        context: context,
                                        categoryName:
                                            ToolsUtilities.categoriesNames[9],
                                        icon: ToolsUtilities.categoriesIcons[9],
                                        indexCategory:
                                            ToolsUtilities.categoriesNames[9],
                                        categoryUrl: ToolsUtilities.allPageUrl,
                                        index: 9)));
                          },
                          child: Text(getTranslated(context, "العضوية"),
                              style: TextStyle(
                                  fontSize: 14,
                                  //letterSpacing: 2,
                                  color: Colors.white))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        color: Color(0xFF27186A),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SingleCategoryPage(
                                      context: context,
                                      categoryName:
                                          ToolsUtilities.categoriesNames[8],
                                      icon: ToolsUtilities.categoriesIcons[8],
                                      indexCategory:
                                          ToolsUtilities.categoriesNames[8],
                                      categoryUrl: ToolsUtilities.homePageUrl,
                                      index: 8)));
                        },
                        child: Text(getTranslated(context, "ميثاق"),
                            style: TextStyle(
                                fontSize: 14,
                                //letterSpacing: 2,
                                color: Colors.white)),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  height: 45,
                  width: size.width - 70,
                  decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/sda.svg",
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(getTranslated(context, "المملكة السعودية"),
                                style: customContent)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/time_icon.svg",
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  getTranslated(context, "الأن"),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset("assets/filter_icon.svg")),
                  ),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Padding(
              padding: standardPaddingX,
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[200]),
                    ),
                    contentPadding: EdgeInsets.all(15),
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: getTranslated(context, "بحث"),
                    hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGray,
                        fontSize: 18),
                    prefixIcon:
                        Icon(Icons.search, size: 30, color: AppColors.black)),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: standardPaddingX,
                child: CarsSlider(),
              ),
            ),
            Container(
              height: 48,
              decoration: BoxDecoration(
                  color: Color(0xFFE5EBF8),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TabBar(
                    unselectedLabelColor: Colors.black,
                    labelColor: Color(0xFFEAEAEE),
                    isScrollable: false,
                    indicatorColor: Color(0xFFE5EBF8),
                    indicator: BoxDecoration(
                        color: Color(0xFF0D0946),
                        borderRadius: BorderRadius.circular(24)),
                    tabs: [
                      Tab(
                        text: getTranslated(context, "الدورات"),
                      ),
                      Tab(text: getTranslated(context, "مدربوا الأكاديمية")),
                      Tab(text: getTranslated(context, "المناسبات")),
                      // Tab(text: "food2"),
                    ]),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: SizedBox(
                height: 230,
                child: !isloggedin
                    ? Center(child: CircularProgressIndicator())
                    : TabBarView(
                        dragStartBehavior: DragStartBehavior.start,
                        children: [
                          Container(child: Mithak()),
                          Container(child: National()),
                          Container(child: Academy()),
                          // Container(child: Text("2021")),
                        ],
                      ),
              )),
            ),
            SizedBox(
              height: 10.0,
            ),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
