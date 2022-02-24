import 'package:flutter/material.dart';

Widget simpleText({
  required String text,
  double? fontsize = 14,
  FontWeight? fontweight = FontWeight.normal,
  Color? textColor = Colors.black,
  String fontFamily = "varela",
}) {
  return Text(
    text,
    style: TextStyle(
      // fontFamily: ,
      fontSize: fontsize,
      fontWeight: fontweight,
      color: textColor,
      fontFamily: fontFamily,
    ),
    textAlign: TextAlign.center,
    maxLines: 2,
  );
}
