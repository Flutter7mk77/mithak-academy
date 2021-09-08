import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:full_web_converter/pages/allPostsPage.dart';
import 'package:url_launcher/url_launcher.dart';

void customURlLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    print('could not launch $command');
  }
}

class ToolsUtilities {
  // static final mainColor = Color(0xffdc3636);
  static final mainColor = Color(0xFF002147);
  static final secondColor = Color(0xff344672);

  static final redColor = Color(0xfffdc800);
  static final whiteColor = Color(0xffffffff);

  //edit the Urls of Web Sites
  static final homePageUrl = "https://mithaqd.com/";
  static final aboutPageUrl = "https://mithaqd.com/about-us-1/";
  static final allPageUrl = "https://mithaqd.com/membership/ ";
  static final firstCategoryPageUrl = "https://mithaqd.com/gallery/";
  static final secondCategoryPageUrl = "https://mithaqd.com/events/";
  static final thirdCategoryPageUrl = "https://mithaqd.com/instructors-2/";
  static final fourthCategoryPageUrl = "https://mithaqd.com/news/";

  static final fifthCategoryPageUrl = "https://mithaqd.com/courses-3/";
  static final sixthCategoryPageUrl =
      "https://mithaqd.com/طلب-انضمام-مدرب-مدربة/";
  static final sevenCategoryPageUrl =
      "https://mithaqd.com/%d8%b7%d9%84%d8%a8-%d8%a7%d8%b3%d8%aa%d8%b4%d8%a7%d8%b1%d8%a9/";

  static final heithCategoryPageUrl =
      "https://mithaqd.com/دورات-القاعة-التدريبية/";
  static final nineCategoryPageUrl = "https://mithaqd.com/طلب-تاشير/";

  //edit the social media Links
  static final facebookUrl =
      "https://web.facebook.com/%D8%A3%D9%83%D8%A7%D8%AF%D9%8A%D9%85%D9%8A%D8%A9-%D9%85%D9%8A%D8%AB%D8%A7%D9%82-%D8%A7%D9%84%D8%AF%D9%88%D9%84%D9%8A%D8%A9-%D9%84%D9%84%D8%AA%D8%AF%D8%B1%D9%8A%D8%A8-%D9%88%D8%A7%D9%84%D8%A7%D8%B3%D8%AA%D8%B4%D8%A7%D8%B1%D8%A7%D8%AA-115235110169503/?_rdc=1&_rdr";
  static final twitterUrl = "https://twitter.com/mithaqalddualia";
  static final instagramUrl = "https://www.instagram.com/mithaq_alddualia/";
  static final linkedinUrl = "https://www.linkedin.com/in/miethaq";
  static final youtubeUrl =
      "https://www.youtube.com/channel/UCInb-4cIkmeftx8POjh-W4g";

//Add your Email
  static final email = "mithaqalddualia@gmail.com";

  //The Url Function that open any Url

  static List categoriesNames = [
    "المعرض",
    " المناسبات",
    " المدربين",
    "  المقالات",
    " الدورات  ",
    "  طلب إنضمام  ",
    "طلب الإستشارة ",
    "دورات القاعة التدريبية",
    "ميثاق",
  ];

  static List categoriesUrls = [
    firstCategoryPageUrl,
    secondCategoryPageUrl,
    thirdCategoryPageUrl,
    fourthCategoryPageUrl,
    fifthCategoryPageUrl,
    sixthCategoryPageUrl,
    sevenCategoryPageUrl,
    heithCategoryPageUrl,
    nineCategoryPageUrl,
    allPageUrl
  ];

  static List categoriesIcons = [
    FontAwesomeIcons.child,
    FontAwesomeIcons.scribd,
    FontAwesomeIcons.laptop,
    FontAwesomeIcons.tv,
    FontAwesomeIcons.cartPlus,
    FontAwesomeIcons.video,
    FontAwesomeIcons.fax,
    FontAwesomeIcons.book,
    FontAwesomeIcons.peopleCarry,
    FontAwesomeIcons.addressCard,
  ];
  static String discoveryImageHeader = 'assets/do.jpg';
  static String contactUsHeaderImage = 'assets/do.jpg';
  static String infoHeaderImage = 'assets/54.jpeg';
  static String ourCategoriesHeaderImage = "assets/do.jpg";
  static String visionImage = "assets/55.jpeg";
  static String missionImage = "assets/236.jpg";
  static String infoParagraphMission =
      " كما تسعى لتكوين صداقات وشراكات مع جميع الدول العاملة فى الحقل التدريبي واستشاري، للنهوض بسير العملية التدريبية في أنحاء العالم الإسلامي.تعمل أكاديمية ميثاق الدولية للتدريب والتسويق من خلال منظومة متكاملة بالتعاون مع العديد من الوكالات الدولية التى تعمل فى العديد من المجالات .";

  static String infoParagraphVision =
      "أكاديمية ميثاق الدولية للتدريب والتسويق هي واحد من الكيانات والمؤسسات التدريبية التى تهدف الى تطوير أفراد المجتمع والهيئات والشركات والكيانات الاقتصادية التي أقيمت على أسس تدريبيه واستشارية سليمة وقيم التدريب الصحيحة ";

  List<Widget> getalllpageUrl() {
    List<Widget> newsPosts = [];
    for (categoriesNames in categoriesUrls) {}
    return newsPosts;
  }
}
