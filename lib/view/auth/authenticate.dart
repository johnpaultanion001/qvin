import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import '../../../styles/widgets/buttons.dart';
import '../../../styles/widgets/logo.dart';
import '../../providers/auth.dart';

class Authenticate extends StatelessWidget {
  const Authenticate({Key? key}) : super(key: key);
  authReady(context) async {
    Provider.of<AuthProvider>(context, listen: false).authReady();
  }

  @override
  Widget build(BuildContext context) {
    authReady(context);
    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
      body: SafeArea(
        child: (Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 160),
              Buttons(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                text: "SIGNUP",
                color: context.resources.color.colorAccent,
                textColor: context.resources.color.textSecondary,
              ),
              Buttons(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                text: "LOGIN",
                color: context.resources.color.colorWhite,
                textColor: context.resources.color.textPrimary,
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(height: 150),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
