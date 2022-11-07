import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

class Buttons extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? textColor;

  const Buttons({
    Key? key,
    this.text,
    this.onTap,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: color,
            borderRadius: BorderRadius.circular(32)),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
                color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
            child: Text(
              text!,
            ),
          ),
        ),
      ),
    );
  }
}
