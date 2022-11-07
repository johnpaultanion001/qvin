import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qvin/styles/AppContextExtension.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
      body: Center(
        child: SpinKitDoubleBounce(
          size: double.maxFinite,
          duration: const Duration(seconds: 4),
          color: context.resources.color.colorWhite,
        ),
      ),
    );
  }
}
