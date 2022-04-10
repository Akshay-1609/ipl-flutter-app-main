import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/teammember/widget/member_list.dart';
import 'package:ipl/presentation/teams/controller/team_controller.dart';
import 'package:ipl/theme/app_style.dart';

class TeamMemberScreen extends StatelessWidget {
  const TeamMemberScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.blue,
        title: Text((Get.find<TeamController>().teamtitle.value)),
      ),
      body: SizedBox(
        child:ListView.builder(
          itemCount: Get.find<TeamController>().teammemberlist.length,
          itemBuilder:(context, index) {
          return teamMemberList(index); 
        }))
      );
  }
}
