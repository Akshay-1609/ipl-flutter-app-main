import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  var teammemberlist = [].obs;
  var teamtitle = "".obs;

  datafatchfromjson(txt) async {
    if (txt == "CSK") {
      String response = await rootBundle.loadString('assets/cskteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Chennai Super Kings";
    }
    else if (txt == "RCB") {
      String response = await rootBundle.loadString('assets/rcbteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Royal Challengers Bangalore";
    }
    else if (txt == "DC") {
      String response = await rootBundle.loadString('assets/dcteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Delhi Capitals";
    }
    else if (txt == "KKR") {
      String response = await rootBundle.loadString('assets/kkrteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Kolkata Knight Riders";
    }
    else if (txt == "MI") {
      String response = await rootBundle.loadString('assets/miteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Mumbai Indians";
    }
    else if (txt == "PBKS") {
      String response = await rootBundle.loadString('assets/pbksteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Punjab Kings";
    }
    else if (txt == "RR") {
      String response = await rootBundle.loadString('assets/rrteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Rajasthan Royals";
    }
     else if (txt == "SRH") {
      String response = await rootBundle.loadString('assets/srhteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Sunrisers Hyderabad";
    }

     else if (txt == "LSG") {
      String response = await rootBundle.loadString('assets/lsgteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Lucknow Super Giants";
    }
     else if (txt == "GT") {
      String response = await rootBundle.loadString('assets/gtteam.json');
      teammemberlist.value = await json.decode(response);
      teamtitle.value = "Gujarat Titans";
    }
    
  }
}
