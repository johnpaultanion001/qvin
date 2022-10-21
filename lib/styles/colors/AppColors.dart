import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

class AppColors {
  @override
  Color get colorPrimary => HexColor("#2699FB");

  @override
  Color get colorAccent => HexColor("#046cc4");

  @override
  Color get colorLightGray => HexColor("#999999");

  @override
  Color get colorDark => HexColor("#000000");

  @override
  Color get colorWhite => HexColor("#FFFFFF");

  //Text Color
  Color get textPrimary => Colors.blue;
  Color get textSecondary => Colors.white;
  Color get textDark => Colors.black12;
  Color get textGray => Colors.grey;

  // Box shadow
  Color get boxShadow => Colors.grey.withOpacity(0.5);
}
