import 'package:flutter/material.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/theme/app_style.dart';

Widget vanueList(context)
{
  return GestureDetector(
      onTap: (){
      // Get.toNamed(AppRoutes.teammemberscreen);
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
                    child: Text("Ahemdabad",style: AppStyle.cardTitleTextStyle,),
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
}