import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/homepgs/home_api/body.dart';

import 'package:flutter_ecommerce_app/homepgs/home_api/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Body();
  }
}
