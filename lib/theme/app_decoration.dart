import 'package:flutter/material.dart';
import 'package:ipl/core/utils/color_constant.dart';

class AppDecoration {
  static BoxDecoration homeScreenMainBox = BoxDecoration(

    image:DecorationImage(opacity:0.3 ,image: AssetImage("assets/allteam.jpg"),fit: BoxFit.fill),
    color: ColorConstant.blue,
    borderRadius: const BorderRadius.all(Radius.circular(26)),
  );

  static BoxDecoration scheduleCardTopLeft = BoxDecoration(
      color: ColorConstant.blue,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25), bottomRight: Radius.circular(25)));

  static BoxDecoration scheduleCardTopRight = BoxDecoration(
      color: ColorConstant.blue,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25), bottomLeft: Radius.circular(25)));

  static BoxDecoration scheduleCardVSText = BoxDecoration(
      border: Border.all(color: ColorConstant.black, width: 1.5),
      borderRadius: const BorderRadius.all(Radius.circular(20)));

  static BoxDecoration scheduleBottom = BoxDecoration(
      color: ColorConstant.lightred,
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)));

            static BoxDecoration scheduleResultBottom = BoxDecoration(
      color: ColorConstant.lightred,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)));
}
