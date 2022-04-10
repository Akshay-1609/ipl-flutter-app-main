import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/presentation/adminpanel/controller/adminpanel_controller.dart';
import 'package:ipl/theme/app_style.dart';

final formkey = GlobalKey<FormState>();

class AdminPanel extends GetWidget<AdminPanelController> {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.blue,
        title: Text("Admin Panel"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 7,
                  // color: ColorConstant.lightred,
                  child: SizedBox(
                    child: TextFormField(
                      onChanged: (value) {
                        controller.fatchDataFromFirebase(value);
                      },
                      validator: (value) {
                        if (value == "" || value == null) {
                          Get.defaultDialog(
                              backgroundColor: Colors.transparent,
                              title: "",
                              barrierDismissible: true,
                              content: AlertDialog(
                                insetPadding: EdgeInsets.zero,
                                scrollable: true,
                                content: Row(
                                  children: [
                                    Icon(
                                      Icons.warning,
                                      color: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text("Enter Match No"),
                                  ],
                                ),
                              ));
                        }
                      },
                      controller: controller.matchNoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Match No:",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 7,
                 
                    child: SizedBox(
                      child: TextFormField(
                        controller: controller.liveUrlController,
                        decoration: InputDecoration(
                            labelText: "Live Score url:",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  )),
              
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 7,
                  // color: ColorConstant.lightred,
                  child: SizedBox(
                    child: TextFormField(
                     
                      keyboardType: TextInputType.number,
                        controller: controller.matchDone,
                        decoration: InputDecoration(
                            labelText: "Match Done:",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ),
              ),
               Obx(()=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 7,
                  // color: ColorConstant.lightred,
                  child: SizedBox(
                    child: TextFormField(
                        controller: controller.team1Result,
                        decoration: InputDecoration(
                            labelText: controller.team1name.value,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ),
              )),
              
              Obx(()=> Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 7,
                  // color: ColorConstant.lightred,
                  child: SizedBox(
                    child: TextFormField(
                        controller: controller.team2Result,
                        decoration: InputDecoration(
                            labelText: controller.team2name.value,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  elevation: 7,
                  // color: ColorConstant.lightred,
                  child: SizedBox(
                    child: TextFormField(
                        controller: controller.matchResultController,
                        decoration: InputDecoration(
                            labelText: "Match Result:",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (formkey.currentState!.validate()) {
              controller.updateDataToFirebase();
            }
          },
          elevation: 10,
          backgroundColor: ColorConstant.blue,
          child: Icon(
            Icons.check,
            size: 30,
          )),
    );
  }
}
