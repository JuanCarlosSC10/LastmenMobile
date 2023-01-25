import 'package:flutter/material.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:last_mobile/view/home.view.dart';
import 'package:last_mobile/view/login.view.dart';
import 'package:last_mobile/view/splash.view.dart';



void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      
    );
  }
}