// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:ipl/presentation/schedule/controller/schedule_controller.dart';
import 'package:ipl/theme/app_style.dart';


  Widget menuItem(context,icon,txt) {
    return GestureDetector(
      onTap: ()async{
      Get.find<HomeScreenController>().pagechnage(txt);
     
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 10,
        child: Container(
          height: MediaQuery.of(context).size.height /6,
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
                    child: CircleAvatar(
                        child: txt=="Live Score"? Icon(Icons.sports_cricket,color: Colors.white,size: 35,):FaIcon(
                          icon,
                          color: ColorConstant.white,
                        ),
                        backgroundColor: Colors.white.withOpacity(0.1)),
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
                    child: Text(txt,style: AppStyle.cardTitleTextStyle,),
                  ),
                  
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
