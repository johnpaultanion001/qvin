import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

class Logo extends StatelessWidget {
  final double height;
  final double width;

  const Logo({
    Key? key,
    this.height = 210,
    this.width = 210,
  }) : super(key: key);

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
