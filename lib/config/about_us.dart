import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslated(context, "أكاديمية ميثاق الدولية"),
              style: TextStyle(fontSize: 14)),
          backgroundColor: ToolsUtilities.mainColor,
          // centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                // using currentState with question mark to ensure it's not null
              },
            ),
          ],
        ),
        backgroundColor: ToolsUtilities.whiteColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ToolsUtilities.mainColor,
                      image: DecorationImage(
                          image: AssetImage('assets/logo.jpg'),
                          fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 00.0, right: 10, left: 10),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, bottom: 8.0, left: 10),
                      child: Text(
                        getTranslated(context, "تواصل معنا"),
                        style: TextStyle(
                            color: ToolsUtilities.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        // textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                customURlLaunch(ToolsUtilities.facebookUrl);
                              },
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                color: ToolsUtilities.secondColor,
                              )),
                          InkWell(
                              onTap: () {
                                customURlLaunch(ToolsUtilities.twitterUrl);
                              },
                              child: Icon(
                                FontAwesomeIcons.twitter,
                                color: ToolsUtilities.secondColor,
                              )),
                          InkWell(
                              onTap: () {
                                customURlLaunch(ToolsUtilities.youtubeUrl);
                              },
                              child: Icon(
                                FontAwesomeIcons.youtube,
                                color: ToolsUtilities.secondColor,
                              )),
                          InkWell(
                              onTap: () {
                                customURlLaunch(ToolsUtilities.linkedinUrl);
                              },
                              child: Icon(
                                FontAwesomeIcons.linkedin,
                                color: ToolsUtilities.secondColor,
                              )),
                          InkWell(
                              onTap: () {
                                customURlLaunch(ToolsUtilities.instagramUrl);
                              },
                              child: Icon(
                                FontAwesomeIcons.instagram,
                                color: ToolsUtilities.secondColor,
                              )),
                        ],
                      ),
                    ),
                    _aboutUsCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Create about Us Card
  Widget _aboutUsCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //name Of our Company or Brand
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            getTranslated(context, "نحن هنا لأجلك"),
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        //name Of our Vision or Brand

        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 18),
          child: Text(
            getTranslated(context, "أكاديمية ميثاق الدولية"),
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold),
            //textDirection: TextDirection.ltr,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4, right: 4),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: 500,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/200.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getTranslated(context,
                        "أكاديمية ميثاق الدولية للتدريب والتسويق هي واحد من الكيانات والمؤسسات التدريبية التى تهدف الى تطوير أفراد المجتمع والهيئات والشركات والكيانات الاقتصادية التي أقيمت على أسس تدريبيه واستشارية سليمة وقيم التدريب الصحيحة"),
                    style: TextStyle(
                      color: ToolsUtilities.secondColor,
                      fontSize: 14,
                    ),
                    // textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ),

        //Our Mission
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 10),
          child: Text(
            getTranslated(context, "أكاديمية ميثاق الدولية للتدريب وتسويق"),
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
            // textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 4, right: 4),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: 380,
                  width: 420,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/19.jpg'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    getTranslated(context,
                        "كما تسعى لتكوين صداقات وشراكات مع جميع الدول العاملة فى الحقل التدريبي واستشاري، للنهوض بسير العملية التدريبية في أنحاء العالم الإسلامي.تعمل أكاديمية ميثاق الدولية للتدريب والتسويق من خلال منظومة متكاملة بالتعاون مع العديد من الوكالات الدولية التى تعمل فى العديد من المجالات"),
                    style: TextStyle(
                      color: ToolsUtilities.secondColor,
                      fontSize: 14,
                    ),
                    // textAlign: TextAlign.justify,
                    // textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
