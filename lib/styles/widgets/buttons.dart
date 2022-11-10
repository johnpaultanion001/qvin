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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            primary: color,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: const TextStyle(
              fontSize: 17,
            ),
            shape: const StadiumBorder(),
            minimumSize: const Size.fromHeight(50)),
        onPressed: onTap,
        child: Text(
          text!,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

    // GestureDetector(
    //   onTap: onTap,
    //   child: Container(
    //     padding: const EdgeInsets.all(20),
    //     decoration: BoxDecoration(
    //         border: Border.all(color: Colors.white),
    //         color: color,
    //         borderRadius: BorderRadius.circular(32)),
    //     child: Center(
    //       child: DefaultTextStyle(
    //         style: TextStyle(
    //             color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
    //         child: Text(
    //           text!,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
