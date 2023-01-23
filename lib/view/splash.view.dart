import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_mobile/view/login.view.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
     Get.to(LoginView()) ;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(
  image: AssetImage('../../assets/image/lastmen-removebg-preview.png'),
), ));
  }
}
