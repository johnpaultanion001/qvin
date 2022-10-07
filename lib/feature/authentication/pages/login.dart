import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';
import 'package:untitled/widgets/labels.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/textField.dart';
import '../../dashboard/dashboard.dart';
import 'password/resetPasswordLink.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: context.resources.color.textSecondary,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: context.resources.color.boxShadow,
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 500,
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: Material(
                  type: MaterialType.transparency,
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Labels.lg(
                            text: 'Login',
                            textColor: context.resources.color.textPrimary,
                          )),
                      const SizedBox(height: 10),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Labels.sm(text: "Lets get started")),
                      const SizedBox(height: 60),
                      const TextFields.text(
                        hintText: 'Email Address',
                      ),
                      const SizedBox(height: 20),
                      const TextFields.text(
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 25),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: _resetPasswordLink,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Labels.sm(text: "Forgot Password?"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Buttons(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()),
                            );
                          },
                          text: "LOGIN",
                          color: context.resources.color.colorAccent,
                          textColor: context.resources.color.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _resetPasswordLink() async {
    final backButton = await Navigator.of(context).push<bool?>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => const ResetPasswordLink(),
      ),
    );
    if (backButton == null || backButton == false) {
      if (mounted) Navigator.of(context).pop();
    }
  }
}
