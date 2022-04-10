import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipl/core/utils/color_constant.dart';

class AppStyle {
  static TextStyle iplTextStyle = GoogleFonts.lato(
    color: ColorConstant.white,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  );

   static TextStyle headingTextStyle = GoogleFonts.lato(
    color: ColorConstant.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  static TextStyle adminMatchNo = GoogleFonts.lato(
    color: ColorConstant.white,
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  static TextStyle cardTitleTextStyle = GoogleFonts.lato(
    color: ColorConstant.black, 
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle cardVSTextStyle = GoogleFonts.lato(
    color: ColorConstant.blue,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle  liveMatchTitle = GoogleFonts.lato(
    color: ColorConstant.lightred,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static TextStyle  liveMatchBattingScore = GoogleFonts.lato(
    color: ColorConstant.blue,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
   static TextStyle  liveMatchCRR = GoogleFonts.lato(
    color: ColorConstant.lightred,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  static TextStyle  liveMatchQRR = GoogleFonts.lato(
    color: ColorConstant.lightred,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static TextStyle  liveMatchUpdate = GoogleFonts.lato(
    color: ColorConstant.lightred,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );
   static TextStyle  liveMatchRecent = GoogleFonts.lato(
    color: ColorConstant.black,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
   static TextStyle  liveMatchTitlerow = GoogleFonts.lato(
    color: ColorConstant.black,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
   static TextStyle  liveMatchBatterName = GoogleFonts.lato(
    color: ColorConstant.blue,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
   static TextStyle  liveMatchBatterData = GoogleFonts.lato(
    color: ColorConstant.lightred,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static TextStyle  liveMatchPartnership = GoogleFonts.lato(
    color: ColorConstant.lightred,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static TextStyle  liveMatchLastWicket = GoogleFonts.lato(
    color: ColorConstant.blue,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
