import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
    ScheduleModel({
        required this.matchDone,
        required this.matchDate,
        required this.result,
        required this.day,
        required this.liveurl,
        required this.match,
        required this.matchTime,
        required this.team1,
        required this.team1Img,
        required this.team1Result,
        required this.team2,
        required this.team2Img,
        required this.team2Result,
    });

    String matchDone;
    String matchDate;
    String result;
    String day;
    String liveurl;
    String match;
    String matchTime;
    String team1;
    String team1Img;
    String team1Result;
    String team2;
    String team2Img;
    String team2Result;

    factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        matchDone: json["Match_Done"],
        matchDate: json["Match_date"],
        result: json["Result"],
        day: json["day"],
        liveurl: json["liveurl"],
        match: json["match"],
        matchTime: json["match_time"],
        team1: json["team1"],
        team1Img: json["team1_img"],
        team1Result: json["team1_result"],
        team2: json["team2"],
        team2Img: json["team2_img"],
        team2Result: json["team2_result"],
    );

    Map<String, dynamic> toJson() => {
        "Match_Done": matchDone,
        "Match_date": matchDate,
        "Result": result,
        "day": day,
        "liveurl": liveurl,
        "match": match,
        "match_time": matchTime,
        "team1": team1,
        "team1_img": team1Img,
        "team1_result": team1Result,
        "team2": team2,
        "team2_img": team2Img,
        "team2_result": team2Result,
    };
}

  
  
 