import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/bottomAppBar.dart';
import 'package:flutter_ecommerce_app/utilites/login/Start.dart';
import 'package:flutter_ecommerce_app/utilites/onboarding/constant.dart';
//import 'package:flutter_ecommerce_app/utilites/onboarding/home.dart';
import 'package:flutter_ecommerce_app/utilites/onboarding/onboard_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoard extends StatefulWidget {
  //static String routeName = "/bottom";

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/19.jpg',
      text: "أكاديمية ميثاق للتدريب و التسويق",
      desc:
          "هي واحد من الكيانات والمؤسسات التدريبية التى تهدف الى تطوير أفراد المجتمع والهيئات والشركات والكيانات الاقتصادية",
      bg: Colors.white,
      button: Color(0xFF303B9B),
    ),
    OnboardModel(
      img: 'assets/13.jpg',
      text: "اكاديمية ميثاق الدولية للإستشارات",
      desc: " أقيمت على أسس تدريبيه واستشارية سليمة وقيم التدريب الصحيحة .",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/15.jpg',
      text: "اكاديمية ميثاق الدولية للإستشارات",
      desc:
          "تعمل أكاديمية ميثاق الدولية للتدريب والتسويق من خلال منظومة متكاملة بالتعاون مع العديد من الوكالات الدولية التى تعمل فى العديد من المجالات .",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => BottomBar()));
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(screens[index].img),
                  Container(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? kbrown
                                      : kbrown300,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: kblack,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      color: kblack,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      print(index);
                      if (index == screens.length - 1) {
                        await _storeOnboardInfo();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Start()));
                      }

                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                      decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(
                          "Next",
                          style: TextStyle(fontSize: 16.0, color: kblue),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.arrow_forward_sharp,
                          color: kblue,
                        )
                      ]),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
