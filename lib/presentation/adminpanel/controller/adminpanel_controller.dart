// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mongo_dart/mongo_dart.dart';

class AdminPanelController extends GetxController {
  var team1name = 'Team 1'.obs;
  var team2name = 'Team 2'.obs;
  var collection;
  var matchNoController = TextEditingController().obs();
  var liveUrlController = TextEditingController().obs();
  var team1Result = TextEditingController().obs();
  var team2Result = TextEditingController().obs();
  var matchResultController = TextEditingController().obs();
  var matchDone = TextEditingController().obs();
  var teamNameController = TextEditingController().obs();
  var pController = TextEditingController().obs();
  var wController = TextEditingController().obs();
  var lController = TextEditingController().obs();
  var nrController = TextEditingController().obs();
  var ptsController = TextEditingController().obs();
  var nrrController = TextEditingController().obs();

  @override
  void onInit() {
    mongodbConnection();
    matchNoController.text = "";
    liveUrlController.text = "";
    matchResultController.text = "";
    teamNameController.text = "";
    team1Result.text = "";
    team2Result.text = "";
    matchDone.text = " ";

    pController.text = "";
    wController.text = "";
    lController.text = "";
    nrController.text = "";
    ptsController.text = "";
    nrrController.text = "";

    super.onInit();
  }

  mongodbConnection() async {
    try {
      var db = await Db.create(
          "mongodb+srv://insightlancer:akshay9577@cluster0.ccnlj.mongodb.net/IPL?retryWrites=true&w=majority");
      await db.open().then(
            (value) => {
              log("MongoDB is connected"),
              collection = db.collection('schedule'),
            },
          );
      // ignore: empty_catches
    } catch (e) {}
  }

  fatchDataFromFirebase(value) async {
    if (await ConnectivityWrapper.instance.isConnected) {
      if (matchNoController.text != "") {
        try {
          var x =
              await collection.find({'match': matchNoController.text}).toList();
          liveUrlController.text = x[0]['liveurl'];
          matchDone.text = x[0]['Match_Done'];
          team1Result.text = x[0]['team1_result'];
          team1name.value = x[0]['team1'];
          team2name.value = x[0]['team2'];
          team2Result.text = x[0]['team2_result'];
          matchResultController.text = x[0]['Result'];
        } catch (e) {
          Get.defaultDialog(
              backgroundColor: Colors.transparent,
              title: "",
              barrierDismissible: true,
              content: AlertDialog(
                insetPadding: EdgeInsets.zero,
                scrollable: true,
                content: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text("Not Valid Input"),
                  ],
                ),
              ));
          matchNoController.clear();
          liveUrlController.clear();
          matchResultController.clear();
          matchDone.clear();
          team1Result.clear();
          team1name.value = 'Team 1';
          team2name.value = 'Team 2';
          team2Result.clear();
        }
      } else {
        matchNoController.clear();
        liveUrlController.clear();
        matchResultController.clear();
        team1name.value = 'Team 1';
        team2name.value = 'Team 2';
        matchDone.clear();
        team1Result.clear();
        team2Result.clear();
      }
    } else {
      Get.defaultDialog(
          backgroundColor: Colors.transparent,
          title: "",
          barrierDismissible: true,
          content: AlertDialog(
            insetPadding: EdgeInsets.zero,
            scrollable: true,
            content: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Icon(
                  Icons.wifi_off,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 7,
                ),
                Text("No Internet"),
              ],
            ),
          ));
    }
  }

  updateDataToFirebase() async {
    if (matchNoController.text != "") {

      if (await ConnectivityWrapper.instance.isConnected) {

        var x = await collection.update(
            where.eq('match', matchNoController.text),
            modify
                .set('Result', matchResultController.text)
                .set('team1_result', team1Result.text)
                .set('Match_Done', matchDone.text)
                .set('team2_result', team2Result.text),
            multiUpdate: true);

        await Get.defaultDialog(
            backgroundColor: Colors.transparent,
            title: "",
            barrierDismissible: true,
            content: AlertDialog(
              insetPadding: EdgeInsets.zero,
              scrollable: true,
              content: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.done_all,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text("Update SuccessFully"),
                ],
              ),
            ));
        matchNoController.clear();
        liveUrlController.clear();
        matchResultController.clear();
        team1name.value = 'Team 1';
        team2name.value = 'Team 2';
        matchDone.clear();
        team1Result.clear();
        team2Result.clear();
      } else {
        Get.defaultDialog(
            backgroundColor: Colors.transparent,
            title: "",
            barrierDismissible: true,
            content: AlertDialog(
              insetPadding: EdgeInsets.zero,
              scrollable: true,
              content: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.wifi_off,
                    color: Colors.green,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text("No Internet"),
                ],
              ),
            ));
      }
     
    }
  }
}
