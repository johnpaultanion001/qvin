import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/BaseColors.dart';

class AppColors implements BaseColors {
  @override
  Color get colorPrimary => HexColor("#2699FB");

  @override
  Color get colorAccent => HexColor("#046cc4");

  @override
  Color get colorLightGray => HexColor("#999999");

  @override
  Color get colorWhite => HexColor("#F4F8FB");

  //Text Color
  Color get textPrimary => Colors.blue;
  Color get textSecondary => Colors.white;
  Color get textDark => Colors.black12;
  Color get textGray => Colors.grey;

  // Box shadow
  Color get boxShadow => Colors.grey.withOpacity(0.5);
}
