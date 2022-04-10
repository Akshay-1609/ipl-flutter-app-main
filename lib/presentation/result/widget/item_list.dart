// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/theme/app_decoration.dart';
import 'package:ipl/theme/app_style.dart';

Widget resultItemList(context, index) {
  return Padding(
    padding: const EdgeInsets.all(7),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: SizedBox(
        child: Column(
          mainAxisSize:MainAxisSize.min,
          children: [
            Row(
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
                        "${Get.find<HomeScreenController>().resultList[index]["day"]}, ${Get.find<HomeScreenController>().resultList[index]["Match_date"]}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child:  Obx(() => CircleAvatar(
                        radius: 35,
                        child: Get.find<HomeScreenController>()
                                .internetcheck
                                .value
                            ? FadeInImage.assetNetwork(placeholder: "assets/splash.gif",image:Get.find<HomeScreenController>()
                                .resultList[index]["team1_img"])
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
                        backgroundColor: Colors.white.withOpacity(0.1)))),
                    SizedBox(
                      height: 5,
                    ),
                    
                     Center(
                        child:Text(Get.find<HomeScreenController>().resultList[index]["team1_result"]))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: AppDecoration.scheduleResultBottom,
                      child: Center(
                          child: Text(
                        "Match - ${index + 1}",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),

                    SizedBox(height: 10,),
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
                      height: 6,
                    ),
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
                      "${Get.find<HomeScreenController>().resultList[index]["match_time"]} (IST)",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                        child:  Obx(() => CircleAvatar(
                        radius: 35,
                        child: Get.find<HomeScreenController>()
                                .internetcheck
                                .value
                            ? FadeInImage.assetNetwork(placeholder: "assets/splash.gif",image:Get.find<HomeScreenController>()
                                .resultList[index]["team2_img"])
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
                        backgroundColor: Colors.white.withOpacity(0.1)))),
                     SizedBox(
                      height: 5,
                    ),
                     Center(
                        child:Text(Get.find<HomeScreenController>().resultList[index]["team2_result"]))
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            Container(

              height: 30,
              decoration: BoxDecoration(
                  color: ColorConstant.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)
                  )
              ),
            
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(Get.find<HomeScreenController>().resultList[index]["Result"],style:TextStyle(color: Colors.white),)
                ],
              ),
            )
            
          ],
        ),
      ),
    ),
  );
}
