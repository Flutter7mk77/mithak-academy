import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/colors.dart';

import 'package:flutter_ecommerce_app/homepgs/home_api/fetchCategories.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/fetchProducts.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/size_config.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
//import 'package:flutter_ecommerce_app/homepgs/title_text.dart';
import 'package:flutter_ecommerce_app/style.dart';

import 'categories.dart';
import 'recommond_products.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Row(
                children: [
                  PrimaryText(
                      text: getTranslated(context, "الدورات التدريبية"),
                      fontWeight: FontWeight.w800,
                      size: 20),
                  Spacer(),
                  PrimaryText(
                      text: 'View all',
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      size: 18)
                ],
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            Divider(height: 5),

            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Row(
                children: [
                  PrimaryText(
                      text: getTranslated(context, "الدورات التدريبية"),
                      fontWeight: FontWeight.w800,
                      size: 20),
                  Spacer(),
                  PrimaryText(
                      text: 'View all',
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      size: 20)
                ],
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            Divider(height: 5),
            // Right Now product is our demo product
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Row(
                children: [
                  PrimaryText(
                      text: getTranslated(context, "مدربوا الأكاديمية"),
                      fontWeight: FontWeight.w800,
                      size: 18),
                  Spacer(),
                  PrimaryText(
                      text: 'View all',
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      size: 18)
                ],
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: snapshot.data)
                    : Center(child: Image.asset('assets/ripple.gif'));
              },
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: Row(
                children: [
                  PrimaryText(
                      text: getTranslated(context, "المناسبات"),
                      fontWeight: FontWeight.w800,
                      size: 20),
                  Spacer(),
                  PrimaryText(
                      text: 'View all',
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      size: 18)
                ],
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
          ],
        ),
      ),
    );
  }
}
