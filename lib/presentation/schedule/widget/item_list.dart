// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:ipl/core/app_export.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/theme/app_style.dart';

Widget scheduleItemList(context, index) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: AppDecoration.scheduleCardTopLeft,
                  child: Center(
                      child: Text(
                    // "Sun 01-MAY-22",
                    "${Get.find<HomeScreenController>().scheduleList[index]["day"]}, ${Get.find<HomeScreenController>().scheduleList[index]["Match_date"]}",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Obx(() => CircleAvatar(
                        radius: 40,
                        child: Get.find<HomeScreenController>()
                                .internetcheck
                                .value
                            ? FadeInImage.assetNetwork(placeholder:'assets/splash.gif' ,image:Get.find<HomeScreenController>()
                                .scheduleList[index]["team1_img"])
                            : Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Icon(
                                Icons.wifi_off_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                        backgroundColor: Colors.white.withOpacity(0.1))))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 3,
                ),
                Transform.rotate(
                  angle: (22 / 7) / 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 2,
                            color: ColorConstant.grey,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: AppDecoration.scheduleCardVSText,
                            child: CircleAvatar(
                              backgroundColor: ColorConstant.white,
                              child: Transform.rotate(
                                  angle: 250,
                                  child: Text(
                                    "VS",
                                    style: AppStyle.cardVSTextStyle,
                                  )),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 2,
                            color: ColorConstant.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration: AppDecoration.scheduleBottom,
                      child: Center(
                          child: Text(
                        "Match - ${index+1}",
                        style: TextStyle(color: Colors.white),
                      )),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: AppDecoration.scheduleCardTopRight,
                  child: Center(
                      child: Text(
                    "${Get.find<HomeScreenController>().scheduleList[index]["match_time"]} (IST)",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Obx(() => CircleAvatar(
                        radius: 40,
                        child:
                            Get.find<HomeScreenController>().internetcheck.value
                                ? FadeInImage.assetNetwork(placeholder: 'assets/splash.gif',image:Get.find<HomeScreenController>()
                                    .scheduleList[index]["team2_img"])
                                : Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(40)),
                                child: Icon(
                                  Icons.wifi_off_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                        backgroundColor: Colors.white.withOpacity(0.1))))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
