// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/app_export.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/presentation/livescore/controller/livescore_controller.dart';
import 'package:ipl/presentation/livescore/widget/display_data_table.dart';
import 'package:ipl/theme/app_style.dart';

class LiveScroe extends GetWidget<LiveScoreController> {
  const LiveScroe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.blue,
          title: const Text("Live Score"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<HomeScreenController>().internetChecker();
            controller.livescoreFatching();
          },
          child: ListView(children: [
            Obx(
              () => Get.find<HomeScreenController>().internetcheck.value
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Get.find<HomeScreenController>().matchdone.value == "1"
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Center(
                                          child: Obx(() => CircleAvatar(
                                              radius: 40,
                                              child: Get.find<
                                                          HomeScreenController>()
                                                      .internetcheck
                                                      .value
                                                  ? Image.network(Get.find<
                                                          HomeScreenController>()
                                                      .team1img
                                                      .value)
                                                  : Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              3,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40)),
                                                      child: const Icon(
                                                        Icons.wifi_off_outlined,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                              backgroundColor: Colors.white
                                                  .withOpacity(0.1)))),
                                      Text(
                                        Get.find<HomeScreenController>()
                                            .team1name
                                            .value,
                                        style: AppStyle.liveMatchRecent,
                                      )
                                    ],
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
                                              decoration: AppDecoration
                                                  .scheduleCardVSText,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    ColorConstant.white,
                                                child: Transform.rotate(
                                                    angle: 250,
                                                    child: Text(
                                                      "VS",
                                                      style: AppStyle
                                                          .cardVSTextStyle,
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
                                  Column(
                                    children: [
                                      Center(
                                          child: Obx(() => CircleAvatar(
                                              radius: 40,
                                              child: Get.find<
                                                          HomeScreenController>()
                                                      .internetcheck
                                                      .value
                                                  ? Image.network(Get.find<
                                                          HomeScreenController>()
                                                      .team2img
                                                      .value)
                                                  : Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              3,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              3,
                                                      decoration: BoxDecoration(
                                                          color: Colors.grey,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      40)),
                                                      child: const Icon(
                                                        Icons.wifi_off_outlined,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                    ),
                                              backgroundColor: Colors.white
                                                  .withOpacity(0.1)))),
                                      Text(
                                        Get.find<HomeScreenController>()
                                            .team2name
                                            .value,
                                        style: AppStyle.liveMatchRecent,
                                      )
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox(),
                        const SizedBox(
                          height: 15,
                        ),
                        Get.find<HomeScreenController>().matchdone.value == "1"
                            ? Column(
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.red,
                                              size: 10,
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            AnimatedTextKit(
                                              animatedTexts: [
                                                WavyAnimatedText('Live',
                                                    textStyle: TextStyle(
                                                        color: Colors.red)),
                                              ],
                                              isRepeatingAnimation: true,
                                              repeatForever: true,
                                            )
                                          ],
                                        ),
                                      ),
                                      Card(
                                        elevation: 6,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Obx(() => Text(
                                                        controller
                                                            .livescore.value,
                                                        style: AppStyle
                                                            .liveMatchBattingScore,
                                                      )),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Obx(() => Text(
                                                        controller.crr.value,
                                                        style: AppStyle
                                                            .liveMatchCRR,
                                                      )),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 1.5,
                                                color: ColorConstant.grey,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Obx(() => Text(
                                                    controller
                                                        .livematchupdate.value,
                                                    // "Mi need 164 runs in 78 balls",
                                                    style: AppStyle
                                                        .liveMatchUpdate,
                                                  )),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Obx(() => Text(
                                                  "Recent: ${controller.recentballs.value}",
                                                  style:
                                                      AppStyle.liveMatchRecent))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Obx(() => livePlayerNameDisplay(
                                              "Batter",
                                              controller.batsman1.value,
                                              controller.batsman2.value)),
                                          Obx(() => liveDataDisplay(
                                              "R",
                                              controller.batsman1R.value,
                                              controller.batsman2R.value)),
                                          Obx(() => liveDataDisplay(
                                              "B",
                                              controller.batsman1B.value,
                                              controller.batsman2B.value)),
                                          Obx(() => liveDataDisplay(
                                              "4s",
                                              controller.batsman14s.value,
                                              controller.batsman24s.value)),
                                          Obx(() => liveDataDisplay(
                                              "6s",
                                              controller.batsman16s.value,
                                              controller.batsman26s.value)),
                                          Obx(() => liveDataDisplay(
                                              "Sr",
                                              controller.batsman1sr.value,
                                              controller.batsman2sr.value)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Obx(() => Text(
                                              "Partnership: ${controller.partnership.value}",
                                              style:
                                                  AppStyle.liveMatchPartnership,
                                            )),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 7,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Obx(() => livePlayerNameDisplay(
                                              "Bowler",
                                              controller.bolwer1.value,
                                              controller.bolwer2.value)),
                                          Obx(() => liveDataDisplay(
                                              "O",
                                              controller.bowler1O.value,
                                              controller.bowler2O.value)),
                                          Obx(() => liveDataDisplay(
                                              "M",
                                              controller.bowler1M.value,
                                              controller.bowler2M.value)),
                                          Obx(() => liveDataDisplay(
                                              "R",
                                              controller.bolwer1R.value,
                                              controller.bolwer2R.value)),
                                          Obx(() => liveDataDisplay(
                                              "W",
                                              controller.bolwer1W.value,
                                              controller.bolwer2W.value)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Obx(() => Text(
                                              "Last Wkt: ${controller.lastwicket.value}",
                                              style:
                                                  AppStyle.liveMatchLastWicket,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: ListView(
                                shrinkWrap: true,
                                children: [
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      WavyAnimatedText('No Data Available',
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    ],
                                    isRepeatingAnimation: true,
                                    repeatForever: true,
                                  ),
                                ],
                              ))
                      ]),
                    )
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/nointernet.png",
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Opps! No Internet",
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ),
            ),
          ]),
        ));
  }
}
