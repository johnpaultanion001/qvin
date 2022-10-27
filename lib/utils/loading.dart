import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:untitled/styles/AppContextExtension.dart';

import '../providers/auth.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});
  initAuthProvider(context) async {
    Provider.of<AuthProvider>(context, listen: false).initAuthProvider();
  }

  @override
  Widget build(BuildContext context) {
    initAuthProvider(context);
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
