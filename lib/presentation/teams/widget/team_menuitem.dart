import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/presentation/teams/controller/team_controller.dart';
import 'package:ipl/routes/app_routes.dart';
import 'package:ipl/theme/app_style.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';

Widget teamsNameList(context, index) {
  return GestureDetector(
    onTap: () {
      Get.find<TeamController>().datafatchfromjson(
          Get.find<HomeScreenController>().teamslist[index]["name"]);
      Get.toNamed(AppRoutes.teammemberscreen);
    },
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: ColorConstant.lightred,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18))),

                  child: Obx(()=> CircleAvatar(
                      child:
                          Get.find<HomeScreenController>().internetcheck.value
                              ? FadeInImage.assetNetwork(placeholder: 'assets/splash.gif',image:Get.find<HomeScreenController>()
                                  .teamslist[index]["image"])
                              : Icon(
                                  Icons.wifi_off,
                                  color: Colors.white,
                                ),
                      backgroundColor: Colors.white.withOpacity(0.1))),
                ),
                Container(
                  color: ColorConstant.blue,
                  height: 5,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    Get.find<HomeScreenController>().teamslist[index]["name"],
                    style: AppStyle.cardTitleTextStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
