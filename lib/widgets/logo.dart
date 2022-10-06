import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
    this.height = 210,
    this.width = 210,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage(context.resources.label.logo),
        ),
      ),
    );
  }
}
