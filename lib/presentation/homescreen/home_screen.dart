// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ipl/core/app_export.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/widget/menu_item.dart';
import 'package:ipl/theme/app_style.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              title: Text('IPL2022'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            elevation: 4,
          
            backgroundColor: ColorConstant.blue,
            onPressed: () {
              Share.share(
                  "https://play.google.com/store/apps/details?id=com.insightlancer.ipl");
            },
            child: Icon(
              Icons.share,
              color: ColorConstant.white,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26)),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: AppDecoration.homeScreenMainBox,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/trophy.png"),
                          Text(
                            "IPL 2022",
                            style: AppStyle.iplTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            menuItem(context, FontAwesomeIcons.calendarAlt,
                                "Live Score"),
                            menuItem(context, FontAwesomeIcons.calendarAlt,
                                "Schedule"),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            menuItem(
                                context, FontAwesomeIcons.tasks, "Result"),
                            menuItem(context, FontAwesomeIcons.userFriends,
                                "Teams"),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
