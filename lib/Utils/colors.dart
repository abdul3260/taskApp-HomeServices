import 'package:flutter/material.dart';

Color backgroundColor = Colors.grey.shade300;
Color colorOffWhite = Colors.white;
Color colorBlack = Colors.black;
Color colorDeepOrange = Colors.deepOrangeAccent;
Color colorGrey = Colors.grey;
Color colorLightBlack = Colors.black54;
Color colorNavigationItem = Color.fromARGB(255, 0, 75, 136);

var gredient = LinearGradient(
  colors: [
    backgroundColor,
    colorOffWhite,
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
