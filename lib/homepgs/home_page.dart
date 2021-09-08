import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/config/cars_slider.dart';
import 'package:flutter_ecommerce_app/constants.dart';
//import 'package:flutter_ecommerce_app/constants.dart';

import 'package:flutter_ecommerce_app/homepgs/colors.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/body.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/home_screen.dart';
//import 'package:flutter_ecommerce_app/homepgs/custom_slider.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/body.dart';

import 'package:flutter_ecommerce_app/homepgs/home_page_json.dart';
//import 'package:flutter_ecommerce_app/homepgs/models/custom_slider.dart';
//import 'package:flutter_ecommerce_app/homepgs/store_detail_page.dart';
import 'package:flutter_ecommerce_app/homepgs/styles.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/details_page.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/home.dart';

//import 'package:flutter_ecommerce_app/utilites/profil/constant.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedCategory = 0;
  List selectedCategoryList = chairs;
  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(menu.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu = index;
                  });
                },
                child: activeMenu == index
                    ? ElasticIn(
                        child: Container(
                          decoration: BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  menu[index],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: white),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 8, bottom: 8),
                          child: Row(
                            children: [
                              Text(
                                menu[index],
                                style: customContent,
                              )
                            ],
                          ),
                        ),
                      ),
              ),
            );
          }),
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
                          "assets/pin_icon.svg",
                          width: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("saoudi arabic", style: customContent)
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
                              "Now",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
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
                child: SvgPicture.asset("assets/filter_icon.svg"),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        CarsSlider(),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        HomeScreen(),
      ],
    );
  }
}
