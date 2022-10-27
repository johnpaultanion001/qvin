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
              const Logo(),
              const SizedBox(height: 160),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Buttons(
                  onTap: _showSignUp,
                  text: "SIGNUP",
                  color: context.resources.color.colorAccent,
                  textColor: context.resources.color.textSecondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Buttons(
                  onTap: _showLogin,
                  text: "LOGIN",
                  color: context.resources.color.colorWhite,
                  textColor: context.resources.color.textPrimary,
                ),
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

  void _showLogin() async {
    Navigator.pushNamed(context, '/login');
  }

  void _showSignUp() async {
    Navigator.pushNamed(context, '/register');
  }
}
