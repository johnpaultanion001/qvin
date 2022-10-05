// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/feature/permission/provider/sliderProvider.dart';
import 'package:untitled/feature/splash/splash.dart';
import 'package:untitled/res/AppContextExtension.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Qvin';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (create) => SliderProvider()),
        ],
        child: MaterialApp(
          title: title,
          theme: ThemeData(
            primaryColor: context.resources.color.colorPrimary,
            accentColor: context.resources.color.colorAccent,
            scaffoldBackgroundColor: Colors.grey.shade100,
            primarySwatch: Colors.grey,
          ),
          home: Splash(),
        ));
  }
}
