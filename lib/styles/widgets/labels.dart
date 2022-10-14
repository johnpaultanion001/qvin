import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final double fontSize;

  const Labels.sm({
    Key? key,
    this.text,
    this.textColor,
    this.fontSize = 12,
  }) : super(key: key);

  const Labels.md({
    Key? key,
    this.text,
    this.textColor,
    this.fontSize = 20,
  }) : super(key: key);

  const Labels.lg({
    Key? key,
    this.text,
    this.textColor,
    this.fontSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        softWrap: true,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: fontSize, fontWeight: FontWeight.bold, color: textColor));
  }
}
