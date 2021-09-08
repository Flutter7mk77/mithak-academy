import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/colors.dart';
import 'package:flutter_ecommerce_app/constants.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/size_config.dart';
import 'package:flutter_ecommerce_app/homepgs/store_detail.dart';
//import 'package:flutter_ecommerce_app/homepgs/store_detail_page.dart';
import 'package:flutter_ecommerce_app/style.dart';

class Mithak extends StatefulWidget {
  // const Mithak({ Key? key }) : super(key: key);

  @override
  _MithakState createState() => _MithakState();
}

class _MithakState extends State<Mithak> {
  int selectedCategory = 0;
  List selectedCategoryList = chairs;

  int activeMenu = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
              selectedCategoryList[index]["details"],
              selectedCategoryList[index]["story"],
            ),
          ),
        ),
      ),
    );
  }

  Widget productCard(BuildContext context, String image, String label,
      String price, String details, String story) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    StoreDetail(image, label, price, details, story)));
      },
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
