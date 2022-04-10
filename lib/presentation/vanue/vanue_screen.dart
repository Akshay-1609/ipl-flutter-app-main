import 'package:flutter/material.dart';
import 'package:ipl/core/app_export.dart';
import 'package:ipl/presentation/vanue/widget/vanue_list.dart';
import 'package:ipl/theme/app_style.dart';

class VanueScreen extends StatelessWidget {
  const VanueScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Padding(
            padding: EdgeInsets.only(top: 25),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: AppDecoration.homeScreenMainBox,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // FaIcon(FontAwesomeIcons.play,color: ColorConstant.white,size: 60,)
                        Text(
                          "Vanue",
                          style: AppStyle.headingTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SizedBox(
                  height: 650,
                  child: GridView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      // ignore: prefer_const_constructors
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return vanueList(context);
                      }),
                ),
              )
          ])));
  }
}