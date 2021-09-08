//import 'package:animate_do/animate_do.dart';
//import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_ecommerce_app/classes/language.dart';
import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/config/cars_slider.dart';
import 'package:flutter_ecommerce_app/config/sized_config.dart';
import 'package:flutter_ecommerce_app/constants.dart';
//import 'package:flutter_ecommerce_app/constf.dart';
import 'package:flutter_ecommerce_app/constt.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/home_screen.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page_json.dart';
//import 'package:flutter_ecommerce_app/homepgs/store_detail_page.dart';
import 'package:flutter_ecommerce_app/homepgs/styles.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
//import 'package:flutter_ecommerce_app/main.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/home_screen.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_page.dart';
//import 'package:flutter_ecommerce_app/homepgs/home_api/body.dart';
//import 'package:flutter_ecommerce_app/productDetail.dart';
import 'package:flutter_ecommerce_app/style.dart';
import 'package:flutter_ecommerce_app/utilites/profil/colors.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:flutter_ecommerce_app/utilites/profil/constant.dart';
// 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //final GlobalKey<FormState> _key = GlobalKey<FormState>();

  int selectedCategory = 0;
  List selectedCategoryList = chairs;
  List selectedCategoryListt = sofas;

  //List selectedCategoryListd = cupboards;

  int activeMenu = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 12),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        color: Color(0xFF27186A),
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text(getTranslated(context, "المعرض"),
                            style: TextStyle(
                                fontSize: 16,
                                //letterSpacing: 2,
                                color: Colors.white))),
                  ),
                  // ignore: deprecated_member_use
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 12),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                        color: ToolsUtilities.mainColor,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {},
                        child: Text(getTranslated(context, "العضوية"),
                            style: TextStyle(
                                fontSize: 16,
                                //letterSpacing: 2,
                                color: Colors.white))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 12),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      color: Color(0xFF180F49),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      child: Text(getTranslated(context, "ميثاق"),
                          style: TextStyle(
                              fontSize: 16,
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
                  hintText: getTranslated(context, "Search"),
                  hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGray,
                      fontSize: 18),
                  prefixIcon:
                      Icon(Icons.search, size: 30, color: AppColors.black)),
            ),
          ),
          Padding(
            padding: standardPaddingX,
            child: CarsSlider(),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 7.5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: [categoriess, categoriessd, categoriessd].length,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 25 : 0,
                      right: 20,
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedCategory = index;
                          selectedCategoryList =
                              categoriess[index]['arrayMappedname'];
                        });
                      },
                      child: PrimaryText(
                        text: categoriess[index]['label'],
                        color: selectedCategory == index
                            ? AppColors.white
                            : AppColors.textGray,
                        fontWeight: FontWeight.w500,
                        size: 15,
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                        primary: selectedCategory == index
                            ? AppColors.primary
                            : Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 2,
          ),
          Padding(
            padding: standardPaddingX,
            child: Row(
              children: [
                PrimaryText(
                    text: getTranslated(context, "أكاديمية ميثاق"),
                    fontWeight: FontWeight.w800,
                    size: 20),
                Spacer(),
                PrimaryText(
                    text: 'View all',
                    color: AppColors.primary,
                    fontWeight: FontWeight.w800,
                    size: 14)
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  selectedCategoryList.length,
                  (index) => productCard(
                    context,
                    selectedCategoryList[index]["image"],
                    selectedCategoryList[index]["label"],
                    selectedCategoryList[index]["price"],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  selectedCategoryListt.length,
                  (index) => productCards(
                    context,
                    selectedCategoryListt[index]["image"],
                    selectedCategoryListt[index]["label"],
                    selectedCategoryListt[index]["price"],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 4,
          ),
          SizedBox(
            height: 15.0,
          ),
          HomeScreen(),
        ],
      ),
    );
  }

  Widget productCard(
      BuildContext context, String image, String label, String price) {
    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: image,
        child: Expanded(
          child: Padding(
            padding: standardPaddingX,
            child: Container(
              padding: EdgeInsets.all(2),
              width: (SizeConfig.screenWidth - 80) / 2,
              height: SizeConfig.blockSizeVertical * 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                                text: label,
                                color: AppColors.textGray,
                                size: 13),
                            SizedBox(height: 5),
                            PrimaryText(
                                text: price,
                                size: 10,
                                fontWeight: FontWeight.w700),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            constraints: BoxConstraints(
                              minWidth: 0,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xfff6c612),
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.add,
                                size: 12, color: Color(0xFF1C1B18))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget productCards(
      BuildContext context, String image, String label, String price) {
    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: image,
        child: Expanded(
          child: Padding(
            padding: standardPaddingX,
            child: Container(
              padding: EdgeInsets.all(2),
              width: (SizeConfig.screenWidth - 80) / 2,
              height: SizeConfig.blockSizeVertical * 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                                text: label,
                                color: AppColors.textGray,
                                size: 13),
                            SizedBox(height: 5),
                            PrimaryText(
                                text: price,
                                size: 10,
                                fontWeight: FontWeight.w700),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            constraints: BoxConstraints(
                              minWidth: 0,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xfff6c612),
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.add,
                                size: 12, color: Color(0xFF1C1B18))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget productCardd(
      BuildContext context, String image, String label, String price) {
    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: image,
        child: Expanded(
          child: Padding(
            padding: standardPaddingX,
            child: Container(
              padding: EdgeInsets.all(2),
              width: (SizeConfig.screenWidth - 80) / 2,
              height: SizeConfig.blockSizeVertical * 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                                text: label,
                                color: AppColors.textGray,
                                size: 13),
                            SizedBox(height: 5),
                            PrimaryText(
                                text: price,
                                size: 10,
                                fontWeight: FontWeight.w700),
                            SizedBox(height: 5),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        bottom: 0,
                        child: RawMaterialButton(
                            onPressed: () {},
                            elevation: 0,
                            constraints: BoxConstraints(
                              minWidth: 0,
                            ),
                            shape: CircleBorder(),
                            fillColor: Color(0xfff6c612),
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.add,
                                size: 12, color: Color(0xFF1C1B18))),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
