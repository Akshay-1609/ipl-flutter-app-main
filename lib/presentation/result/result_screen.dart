import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/presentation/result/widget/item_list.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.blue,
          title: const Text("Result"),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<HomeScreenController>().scheduleDataFatchFromFirebase();
            Get.find<HomeScreenController>().internetChecker();
          },
          // ignore: prefer_is_empty
          child: Obx(
            () => Get.find<HomeScreenController>().internetcheck.value
                ? Get.find<HomeScreenController>().resultList.length != 0
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            // physics: ScrollPhysics(),
                            itemCount: Get.find<HomeScreenController>()
                                .resultList
                                .length,
                            itemBuilder: (context, index) {
                              return resultItemList(context, index);
                            }),
                      )
                    : Center(
                      child: ListView(
                        shrinkWrap: true,
                   children: [
                           Center(
                            child: AnimatedTextKit(
                            animatedTexts: [
                              WavyAnimatedText('No Data Available',
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                            isRepeatingAnimation: true,
                            repeatForever: true,
                          ))
                   ],
                      ),
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
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }
}
