// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';
import 'dart:developer';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ipl/routes/app_routes.dart';
import 'package:mongo_dart/mongo_dart.dart';

class HomeScreenController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var collection;
  var teamslist = [].obs;
  List scheduleList = [];
  List resultList = [];
  var totalScheduleLength = 0.obs;
  var internetcheck = false.obs;
  var matchNo = "".obs;
  var matchdone = "".obs;
  var matchurl = "".obs;
  var team1name = "".obs;
  var team2name = "".obs;
  var team1img = "".obs;
  var team2img = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mongodbConnection();
    internetChecker();
  }

  mongodbConnection() async {
    try {
      var db = await Db.create(
          "mongodb+srv://insightlancer:akshay9577@cluster0.ccnlj.mongodb.net/IPL?retryWrites=true&w=majority");
      await db.open().then(
            (value) => {
              log("MongoDB is connected"),
              collection = db.collection('schedule'),
              scheduleDataFatchFromFirebase()
            },
          );
      // ignore: empty_catches
    } catch (e) {}
  }

  getteamdetail() async {
    String response = await rootBundle.loadString('assets/teams.json');
    teamslist.value = await json.decode(response);
  }

  internetChecker() async {
    if (await ConnectivityWrapper.instance.isConnected) {
      internetcheck.value = true;
    } else {
      internetcheck.value = false;
    }
  }

  scheduleDataFatchFromFirebase() async {
    scheduleList = [];
    if (await ConnectivityWrapper.instance.isConnected) {
      var x = await collection.find().toList();
      x.forEach((items) => {scheduleList.add(items)});
      resultFilterData();
    }
  }

  resultFilterData() {
    resultList = [];
    scheduleList.forEach((item) {
      if (item["Result"] != "") {
        resultList.add(item);
      }
    });
  }

  todaymatch() async {
    if (await ConnectivityWrapper.instance.isConnected) {
      var x = await collection.find({
        'Match_date': DateFormat('d/M/yyyy').format(DateTime.now()).toString(),
        'Match_Done': '1'
      }).toList();
      if (x.length > 0) {
        matchNo.value = x[0]['match'];
        matchdone.value = x[0]["Match_Done"];
        matchurl.value = x[0]["liveurl"];
        team1name.value = x[0]["team1"];
        team2name.value = x[0]["team2"];
        team1img.value = x[0]["team1_img"];
        team2img.value = x[0]["team2_img"];
      }
    }
  }

  pagechnage(value) async {
    if (value == "Schedule") {
      await scheduleDataFatchFromFirebase();
      await Get.toNamed(AppRoutes.schedulescreen);
    } else if (value == "Result") {
      await scheduleDataFatchFromFirebase();
      await resultFilterData();
      await Get.toNamed(AppRoutes.resultscreen);
    } else if (value == "Teams") {
      await getteamdetail();
      await Get.toNamed(AppRoutes.teamscreen);
    } else if (value == "Live Score") {
      await todaymatch();
      await Get.toNamed(AppRoutes.livescorescreen);
    }
  }
}
