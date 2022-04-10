// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/presentation/schedule/widget/item_list.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.blue,
          title: Text("Schedule"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<HomeScreenController>().scheduleDataFatchFromFirebase();
            Get.find<HomeScreenController>().internetChecker();
          },
          child: SizedBox( 
            child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Obx(
                  () => Get.find<HomeScreenController>().internetcheck.value
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                                   shrinkWrap: true,
        physics: ScrollPhysics(),
                              // physicWs: ScrollPhysics(),

                              itemCount: Get.find<HomeScreenController>()
                                  .scheduleList
                                  .length,
                              itemBuilder: (context, index) {

                                return scheduleItemList(context, index);
                              }),
                        )
                      : ListView(
                        children: [
                          Center(
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
                            ),)
                        ],
                        
                          ),
                      ),
                )),
          ),
        );
  }
}
