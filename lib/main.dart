// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:untitled/feature/splash/splash.dart';
import 'package:untitled/res/AppContextExtension.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qvin',
      theme: ThemeData(
        primaryColor: context.resources.color.colorPrimary,
        accentColor: context.resources.color.colorAccent,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: Splash(),
    );
  }

}



