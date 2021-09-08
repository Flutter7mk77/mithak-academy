import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_ecommerce_app/routes.dart';
import 'package:flutter_ecommerce_app/utilites/login/Login.dart';
import 'package:flutter_ecommerce_app/utilites/login/SignUp.dart';
import 'package:flutter_ecommerce_app/utilites/login/Start.dart';
import 'package:flutter_ecommerce_app/utilites/onboarding/onboard.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_ecommerce_app/bottomAppBar.dart';
import 'package:flutter_ecommerce_app/localization/demo_localization.dart';
import 'package:flutter_ecommerce_app/localization/language_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

int isviewed;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else
      return MaterialApp(
        title: 'Mithaqd APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("ar", "SA"),
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: isviewed != 0 ? OnBoard() : BottomBar(),
        routes: <String, WidgetBuilder>{
          "Login": (BuildContext context) => Login(),
          "SignUp": (BuildContext context) => SignUp(),
          "start": (BuildContext context) => Start(),
        },
      );
  }
}
