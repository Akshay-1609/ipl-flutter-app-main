// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanelController extends GetxController {
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
    matchNoController.text = "";
    liveUrlController.text = "";
    matchResultController.text = "";
    teamNameController.text = "";
    team1Result.text = "";
    team2Result.text = "";
    matchDone.text=" ";

    pController.text = "";
    wController.text = "";
    lController.text = "";
    nrController.text = "";
    ptsController.text = "";
    nrrController.text = "";

    super.onInit();
  }

  fatchDataFromFirebase(value) async {
    if (await ConnectivityWrapper.instance.isConnected) {
      FirebaseDatabase.instance
          .ref("IPL")
          .child("schedule")
          .child(value)
          .once()
          .then((snapshot) async {
           
        if (matchNoController.text != "") {
          if (snapshot.snapshot.exists) {
            liveUrlController.text =
                snapshot.snapshot.child("liveurl").value.toString();
                matchDone.text=snapshot.snapshot.child("Match_Done").value.toString();
            team1Result.text =
                snapshot.snapshot.child("team1_result").value.toString();
            team2Result.text =
                snapshot.snapshot.child("team2_result").value.toString();
            matchResultController.text =
                snapshot.snapshot.child("Result").value.toString();
          } else {
            liveUrlController.clear();
            matchResultController.clear();
            matchDone.clear();
            team1Result.clear();
            team2Result.clear();
          }
        } else {
          liveUrlController.clear();
          matchResultController.clear();
            matchDone.clear();
            team1Result.clear();
            team2Result.clear();
        }
      });
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
        FirebaseDatabase.instance
            .ref("IPL")
            .child("schedule")
            .child(matchNoController.text)
            .update({
          "liveurl": liveUrlController.text,
          "Result": matchResultController.text,
          "Match_Done":matchDone.text,
          "team1_result":team1Result.text,
          "team2_result":team2Result.text
        }).then((value) => {
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
                              Icons.done_all,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text("Update SuccessFully"),
                          ],
                        ),
                      )),
                  matchNoController.clear(),
                  liveUrlController.clear(),
                  matchDone.clear(),
                  matchResultController.clear()
                });
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
