import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:last_mobile/util/colors.dart';
import 'package:last_mobile/view/home.view.dart';
import 'package:last_mobile/view/login.view.dart';
import 'package:last_mobile/view/splash.view.dart';
import 'view/productos.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,

      home: SplashView(), //go to login page
    );
  }
}
