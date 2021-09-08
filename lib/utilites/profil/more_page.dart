import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/utilites/profil/colors.dart';
//import 'package:flutter_ecommerce_app/utilites/profil/constant.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    // var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Row(
            children: [
              Container(
                width: 120,
                height: 90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage("assets/membership.png"),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "telli.medkamel@gmail.com",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(getTranslated(context, "بطاقة العضوية"),
                        style: TextStyle(fontSize: 15, color: grey),
                        textDirection: TextDirection.rtl),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: ListView(
            children: [
              Text(
                getTranslated(context, "الإعدادت"),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    getTranslated(context, "حساب"),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildAccountOptionRow(context, getTranslated(context, "حساب")),
              buildAccountOptionRow(
                  context, getTranslated(context, "الأعددات")),
              buildAccountOptionRow(context, getTranslated(context, "خصائص")),
              buildAccountOptionRow(context, getTranslated(context, "معلومات")),
              buildAccountOptionRow(
                  context, getTranslated(context, "تغير اللغة")),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Icon(
                    Icons.volume_up_outlined,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    getTranslated(context, "الاشعارات"),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(
                height: 15,
                thickness: 2,
              ),
              SizedBox(
                height: 10,
              ),
              buildNotificationOptionRow(
                  getTranslated(context, "العضوية"), true),
              buildNotificationOptionRow(
                  getTranslated(context, "المعرض"), true),
              buildNotificationOptionRow(getTranslated(context, "حساب"), false),
              SizedBox(
                height: 30,
              ),
              Center(
                // ignore: deprecated_member_use
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text(getTranslated(context, "تسجيل الخروج"),
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2.2,
                          color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          getTranslated(context, title),
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      getTranslated(context, title),
                    ),
                    Text(
                      getTranslated(context, title),
                    ),
                    Text(
                      getTranslated(context, title),
                    ),
                  ],
                ),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        getTranslated(context, "المعرض"),
                      )),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getTranslated(context, title),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
