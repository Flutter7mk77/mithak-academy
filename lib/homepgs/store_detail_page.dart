import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constf.dart';
import 'package:flutter_ecommerce_app/homepgs/colors.dart';
import 'package:flutter_ecommerce_app/homepgs/home_page_json.dart';
import 'package:flutter_ecommerce_app/homepgs/styles.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
//import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class StoreDetailPage extends StatefulWidget {
  List selectedCategoryListd = cupboards;

  final String image;
  final String label;
  final String price;
  final String details;
  StoreDetailPage(this.image, this.label, this.price, this.details);
  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
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
                          image: AssetImage(widget.image),
                          fit: BoxFit.contain)),
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
                          "",
                          style: TextStyle(fontSize: 14, height: 1.3),
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: black.withOpacity(0.3),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.price,
                    style: customContent,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text(
                        getTranslated(context, "احدث المقالات"),
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: List.generate(packForYou.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Row(
                              children: [
                                Container(
                                    width: (size.width - 30) * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          packForYou[index]['name'],
                                          style: TextStyle(
                                              fontSize: 16,
                                              height: 1.5,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          packForYou[index]['description'],
                                          style: TextStyle(height: 1.3),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          packForYou[index]['price'],
                                          style: TextStyle(
                                              color: Color(0xfff6c618),
                                              height: 1.3,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 110,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10),
                                      child: Image(
                                        image: AssetImage(
                                            packForYou[index]['img']),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
