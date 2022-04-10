import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:ipl/presentation/homescreen/controller/home_controller.dart';
import 'package:mongo_dart/mongo_dart.dart';

late Timer timer;

class LiveScoreController extends GetxController {
  var livescore = "".obs;
  var crr = "".obs;
  var recentballs = "".obs;
  var livematchupdate = "".obs;
  var batsman1 = "".obs;
  var batsman2 = "".obs;
  var batsman1R = "".obs;
  var batsman2R = "".obs;
  var batsman1B = "".obs;
  var batsman2B = "".obs;
  var batsman14s = "".obs;
  var batsman24s = "".obs;
  var batsman16s = "".obs;
  var batsman26s = "".obs;
  var batsman1sr = "".obs;
  var batsman2sr = "".obs;
  var partnership = "".obs;
  // batsmane data above
  var bolwer1 = "".obs;
  var bolwer2 = "".obs;
  var bowler1O = "".obs;
  var bowler2O = "".obs;
  var bowler1M = "".obs;
  var bowler2M = "".obs;
  var bolwer1R = "".obs;
  var bolwer2R = "".obs;
  var bolwer1W = "".obs;
  var bolwer2W = "".obs;
  var lastwicket = "".obs;
  // bowler data above
  livescoreFatching() async {
    if (Get.find<HomeScreenController>().internetcheck.value) {
      try {
        var url = Uri.parse(
            "https://cricket-api.vercel.app/cri.php?url=${Get.find<HomeScreenController>().matchurl.value}");
        http.Response response = await http.get(url);
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["livescore"]["current"] != "Data Not Found") {
          livescore.value = data["livescore"]["current"] != "Data Not Found"
              ? data["livescore"]["current"]
              : livescore.value;
          crr.value = data["livescore"]["runrate"] != "Data Not Found"
              ? data["livescore"]["runrate"]
              : crr.value;
          recentballs.value =
              data["livescore"]["recentballs"] != "Data Not Found"
                  ? data["livescore"]["recentballs"]
                  : recentballs.value;
          livematchupdate.value =
              data["livescore"]["update"] != "Data Not Found"
                  ? data["livescore"]["update"]
                  : livematchupdate.value;
          batsman1.value = data["livescore"]["batsman"] != "Data Not Found"
              ? data["livescore"]["batsman"]
              : batsman1.value;
          batsman2.value = data["livescore"]["batsmantwo"] != "Data Not Found"
              ? data["livescore"]["batsmantwo"]
              : batsman2.value;
          batsman1R.value = data["livescore"]["batsmanrun"] != "Data Not Found"
              ? data["livescore"]["batsmanrun"]
              : batsman1R.value;
          batsman2R.value =
              data["livescore"]["batsmantworun"] != "Data Not Found"
                  ? data["livescore"]["batsmantworun"]
                  : batsman2R.value;
          batsman1B.value = data["livescore"]["ballsfaced"] != "Data Not Found"
              ? data["livescore"]["ballsfaced"]
              : batsman1B.value;
          batsman2B.value =
              data["livescore"]["batsmantwoballsfaced"] != "Data Not Found"
                  ? data["livescore"]["batsmantwoballsfaced"]
                  : batsman2B.value;
          batsman14s.value = data["livescore"]["fours"] != "Data Not Found"
              ? data["livescore"]["fours"]
              : batsman14s.value;
          batsman24s.value =
              data["livescore"]["batsmantwofours"] != "Data Not Found"
                  ? data["livescore"]["batsmantwofours"]
                  : batsman24s.value;
          batsman16s.value = data["livescore"]["sixes"] != "Data Not Found"
              ? data["livescore"]["sixes"]
              : batsman16s.value;
          batsman26s.value =
              data["livescore"]["batsmantwosixes"] != "Data Not Found"
                  ? data["livescore"]["batsmantwosixes"]
                  : batsman26s.value;
          batsman1sr.value = data["livescore"]["sr"] != "Data Not Found"
              ? data["livescore"]["sr"]
              : batsman1sr.value;
          batsman2sr.value =
              data["livescore"]["batsmantwosr"] != "Data Not Found"
                  ? data["livescore"]["batsmantwosr"]
                  : batsman2sr.value;
          partnership.value =
              data["livescore"]["partnership"] != "Data Not Found"
                  ? data["livescore"]["partnership"]
                  : partnership.value;
          // Batsman All Data Fatched by Json File
          bolwer1.value = data["livescore"]["bowler"] != "Data Not Found"
              ? data["livescore"]["bowler"]
              : bolwer1.value;
          bolwer2.value = data["livescore"]["bowlertwo"] != "Data Not Found"
              ? data["livescore"]["bowlertwo"]
              : bolwer2.value;
          bowler1O.value = data["livescore"]["bowlerover"] != "Data Not Found"
              ? data["livescore"]["bowlerover"]
              : bowler1O.value;
          bowler2O.value =
              data["livescore"]["bowletworover"] != "Data Not Found"
                  ? data["livescore"]["bowletworover"]
                  : bowler2O.value;
          bowler1M.value = data["livescore"]["bowlermaiden"] != "Data Not Found"
              ? data["livescore"]["bowlermaiden"]
              : bowler1M.value;
          bowler2M.value =
              data["livescore"]["bowlertwomaiden"] != "Data Not Found"
                  ? data["livescore"]["bowlertwomaiden"]
                  : bowler2M.value;
          bolwer1R.value = data["livescore"]["bowlerruns"] != "Data Not Found"
              ? data["livescore"]["bowlerruns"]
              : bolwer1R.value;
          bolwer2R.value =
              data["livescore"]["bowlertworuns"] != "Data Not Found"
                  ? data["livescore"]["bowlertworuns"]
                  : bolwer2R.value;
          bolwer1W.value =
              data["livescore"]["bowlerwickets"] != "Data Not Found"
                  ? data["livescore"]["bowlerwickets"]
                  : bolwer1W.value;
          bolwer2W.value =
              data["livescore"]["bowlertwowickets"] != "Data Not Found"
                  ? data["livescore"]["bowlertwowickets"]
                  : bolwer2W.value;
          // Chnages here....
          if ((data["livescore"]["lastwicket"]).toString().contains("...")) {
            recentballs.value =
                data["livescore"]["lastwicket"] != "Data Not Found"
                    ? data["livescore"]["lastwicket"]
                    : recentballs.value;
          } else {
            lastwicket.value =
                data["livescore"]["lastwicket"] != "Data Not Found"
                    ? data["livescore"]["lastwicket"]
                    : lastwicket.value;
          }

          if (data['livescore']['teamone'] != 'Data Not Found' &&
              data['livescore']['teamtwo'] != 'Data Not Found') {
            var collection = Get.find<HomeScreenController>().collection;
            collection.update(
                where.eq(
                    'match', Get.find<HomeScreenController>().matchNo.value),
                modify
                    .set('Result', data["livescore"]["update"])
                    .set('team1_result', data["livescore"]["teamone"])
                    .set('team2_result', data["livescore"]["teamtwo"]),
                multiUpdate: true);
          }
        }

        // ignore: empty_catches
      } catch (e) {}
    }
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    livescoreFatching();
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => livescoreFatching());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }
}
