import 'package:flutter/material.dart';

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}

BoxDecoration backgroundGradient() {
  return BoxDecoration(
      gradient: LinearGradient(
    colors: [
     
      hexStringToColor("edf2f4"),
      hexStringToColor("caf0f8"),
      hexStringToColor("8ecae6"),

    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ));
}
final Color themeColor =hexStringToColor("084c61");
final Color backgroundColor =hexStringToColor("eae2b7");