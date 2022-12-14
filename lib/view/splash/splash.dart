// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import '../permission/permission.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  _SplashState() {
    Timer(const Duration(milliseconds: 3000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
            PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  PermissionScreen(),
              transitionDuration: Duration(milliseconds: 1500),
            ),
            (_) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: context.resources.color.colorPrimary),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 2000),
          opacity: 1,
          child: Center(
            child: Hero(
              tag: 'logo',
              child: Container(
                height: 250.0,
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage(context.resources.label.logo),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
