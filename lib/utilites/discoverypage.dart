import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/classes/language.dart';
import 'package:flutter_ecommerce_app/config/contact_us.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:flutter_ecommerce_app/main.dart';
//import 'package:flutter_ecommerce_app/homepgs/styles.dart';
//import 'package:flutter_ecommerce_app/utilites/size_config.dart';
import 'package:flutter_ecommerce_app/utilites/toolsUtilities.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with TickerProviderStateMixin {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  bool showSpinner = true;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Container(
              child: _customHeading(),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
          child: Container(
            color: ToolsUtilities.whiteColor,
            child: SizedBox(
              height: 2,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                ToolsUtilities.mainColor,
                ToolsUtilities.secondColor
              ])),
          child: Expanded(
            child: TabBar(
              indicatorColor: ToolsUtilities.whiteColor,
              controller: _controller,
              tabs: [
                Tab(
                  icon: const Icon(Icons.home),
                  text: getTranslated(context, "أكاديمية ميثاق الدولية"),
                ),
                Tab(
                  icon: const Icon(Icons.info),
                  text: getTranslated(context, "عنا"),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: ToolsUtilities.whiteColor,
            height: MediaQuery.of(context).size.height * 0.9,
            child: new TabBarView(
              controller: _controller,
              children: <Widget>[
                Container(
                  height: 400,
                  child: ModalProgressHUD(
                    // opacity: 0.6,
                    color: Color(0xFF002147),
                    inAsyncCall: showSpinner,
                    child: WebView(
                      initialUrl: ToolsUtilities.homePageUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finished) {
                        setState(() {
                          showSpinner = false;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  child: ModalProgressHUD(
                    //opacity: 0.6,
                    color: Color(0xFF002147),
                    inAsyncCall: showSpinner,
                    child: WebView(
                      initialUrl: ToolsUtilities.aboutPageUrl,
                      javascriptMode: JavascriptMode.unrestricted,
                      onPageFinished: (finished) {
                        setState(() {
                          showSpinner = false;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _customHeading() {
    return AppBar(
      backgroundColor: Color(0xFF002147),
      title:
          Text(getTranslated(context, "أكاديمية ميثاق الدولية للتدريب وتسويق")),
      titleTextStyle: TextStyle(fontSize: 6.0),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: DropdownButton<Language>(
            underline: SizedBox(),
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            onChanged: (Language language) {
              _changeLanguage(language);
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          e.flag,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(e.name)
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/docs6.svg",
              //height: 20.0,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUsPage()));
            },
            //  color: Colors.white,
          ),
        ),

        // SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
