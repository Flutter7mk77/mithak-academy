import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constants.dart';
import 'package:flutter_ecommerce_app/constf.dart';
import 'package:flutter_ecommerce_app/constt.dart';
import 'package:flutter_ecommerce_app/homepgs/colors.dart';
import 'package:flutter_ecommerce_app/homepgs/home_page_json.dart';
import 'package:flutter_ecommerce_app/homepgs/styles.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class StoreDetail extends StatefulWidget {
  List selectedCategoryListt = sofas;
  List selectedCategoryList = chairs;
  List selectedCategoryListd = cupboards;

  final String image;
  final String label;
  final String price;
  final String details;
  final String story;
  StoreDetail(this.image, this.label, this.price, this.details, this.story);
  @override
  _StoreDetailState createState() => _StoreDetailState();
}

class _StoreDetailState extends State<StoreDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 80,
      width: size.width,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: black.withOpacity(0.1)))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Text(
              widget.price,
              style: TextStyle(
                  color: primary, fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: size.width,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.cover)),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back,
                              size: 18,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              color: white, shape: BoxShape.circle),
                          child: Center(
                            child: Icon(
                              Icons.favorite_border,
                              size: 18,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: size.width - 30,
                        child: Text(
                          "Cafe - Coffee & Tea - Breakfast and Brunch - Bakery \$",
                          style: TextStyle(fontSize: 14, height: 1.3),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.hourglass_bottom,
                              color: primary,
                              size: 16,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              "40-50 Min",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: textFieldColor,
                              borderRadius: BorderRadius.circular(3)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              children: [
                                Text(
                                  "4.7",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.star,
                                  color: primary,
                                  size: 17,
                                ),
                                Text(
                                  "(16)",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: black.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.label,
                    style: customContent,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        width: (size.width) * 0.80,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/pin_icon.svg",
                              width: 15,
                              color: black.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "38 Park Row Frnt 4,New York,NY 1003",
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "More Info",
                          style: TextStyle(
                              fontSize: 14,
                              color: primary,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.comment,
                        size: 15,
                        color: primary,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "People say...",
                        style: TextStyle(
                          fontSize: 14,
                          color: black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(peopleFeedback.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: primary.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                                child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                peopleFeedback[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: primary,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width - 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: black.withOpacity(0.1))),
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.label,
                            style: TextStyle(color: black.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: (size.width - 70) * 0.8,
                                child: Text(
                                  widget.story,
                                  style: TextStyle(fontSize: 14, height: 1.5),
                                ),
                              ),
                              Container(
                                width: (size.width - 70) * 0.2,
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: black.withOpacity(0.15)),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_circle_up_outlined,
                                      color: black.withOpacity(0.4),
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: black.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
