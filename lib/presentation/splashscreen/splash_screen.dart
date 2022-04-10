import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/routes/app_routes.dart';
const colorizeColors = [
  Color(0xff161853),
  Color(0xffec255a),
];

const colorizeTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Horizon',
);
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () => Get.offAndToNamed(AppRoutes.homescreen));
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/ipl_splash.png"),
             Image.asset("assets/splash.gif",height: 140,width: 140,),
           AnimatedTextKit(
        animatedTexts: [
         ColorizeAnimatedText(
          'Developed by - Insightlancer',
          textStyle: colorizeTextStyle,
          colors: colorizeColors,
        ),
        ])
           
          ],
        ),
      ),
    );
  }
}
