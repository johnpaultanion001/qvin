// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view/splash/splash.dart';
import 'package:untitled/styles/AppContextExtension.dart';

import 'providers/informationProvider.dart';
import 'providers/sliderProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String title = 'Qvin';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (create) => SliderProvider()),
          ChangeNotifierProvider(create: (create) => InfomationProvider()),
        ],
        child: MaterialApp(
          title: title,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: context.resources.color.colorPrimary,
            accentColor: context.resources.color.colorPrimary,
            scaffoldBackgroundColor: context.resources.color.colorWhite,
            primarySwatch: Colors.grey,
          ),
          home: Splash(),
        ));
  }
}
