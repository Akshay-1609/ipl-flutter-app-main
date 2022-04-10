import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/teams/controller/team_controller.dart';

Widget teamMemberList(index){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(  backgroundColor: ColorConstant.grey,
        child: Center(child: Icon(Icons.person,color: Colors.white,size: 25,))
        ),
        title: Text(Get.find<TeamController>().teammemberlist[index]["name"]),
        subtitle: Text(Get.find<TeamController>().teammemberlist [index]["role"])
      ),
    ),
  );
}