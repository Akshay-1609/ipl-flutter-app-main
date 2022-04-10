import 'package:flutter/cupertino.dart';
import 'package:ipl/core/utils/color_constant.dart';
import 'package:ipl/theme/app_style.dart';

Widget liveDataDisplay(title, player1, player2) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: AppStyle.liveMatchTitlerow,
      ),
      SizedBox(
        height: 3,
      ),
      Container(
        height: 3,
        width: 40,
        color: ColorConstant.grey,
      ),
      SizedBox(
        height: 10,
      ),
      Text(player1, style: AppStyle.liveMatchBatterData),
      SizedBox(
        height: 10,
      ),
      Text(player2, style: AppStyle.liveMatchBatterData)
    ],
  );
}

Widget livePlayerNameDisplay(title, pl1name, pl2name) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: AppStyle.liveMatchTitlerow,
      ),
      SizedBox(
        height: 3,
      ),
      Container(
        height: 3,
        width: 80,
        color: ColorConstant.grey,
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        pl1name,
        style: AppStyle.liveMatchBatterName,
      ),
      SizedBox(
        height: 10,
      ),
      Text(pl2name, style: AppStyle.liveMatchBatterName)
    ],
  );
}
