import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import '../../../styles/widgets/buttons.dart';
import '../../../styles/widgets/logo.dart';
import 'login.dart';
import 'typeOfUser.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);
  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
      body: SafeArea(
        child: (Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 3,
                child: Logo(),
              ),
              const SizedBox(height: 150),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Buttons(
                    onTap: _showSignUp,
                    text: "SIGNUP",
                    color: context.resources.color.colorAccent,
                    textColor: context.resources.color.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Buttons(
                    onTap: _showLogin,
                    text: "LOGIN",
                    color: context.resources.color.colorWhite,
                    textColor: context.resources.color.textPrimary,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: const SizedBox(height: 150),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _showLogin() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => const Login(),
      ),
    );
  }

  void _showSignUp() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => TypeOfUser(),
      ),
    );
  }
}
