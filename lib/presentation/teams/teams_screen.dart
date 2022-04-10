import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/presentation/teams/widget/team_menuitem.dart';


class TeamsScreen extends StatelessWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstant.blue,
          title: Text("Team"),
        ),
        body: RefreshIndicator(
          onRefresh: () => Get.find<HomeScreenController>().getteamdetail(),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15,top: 15),
            child: ListView(
              children: [
            SingleChildScrollView(
              child: SizedBox(
                  // height: MediaQuery.of(context).size.height ,
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      // ignore: prefer_const_constructors
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10, 
                        crossAxisCount: 2,
                      ),
                      itemCount: Get.find<HomeScreenController>().teamslist.length,
                      itemBuilder: (context, index) {
                        return teamsNameList(context, index);
                      }),
                ),
            ),],
            ),
          ),
        ));
  }
}
