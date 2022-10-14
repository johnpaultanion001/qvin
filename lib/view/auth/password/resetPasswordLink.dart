// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';

import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';
import '../../../../styles/widgets/textField.dart';
import 'resetPassword.dart';

class ResetPasswordLink extends StatefulWidget {
  const ResetPasswordLink({Key? key}) : super(key: key);

  @override
  State<ResetPasswordLink> createState() => _ResetPasswordLinkState();
}

class _ResetPasswordLinkState extends State<ResetPasswordLink> {
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
                      Row(
                        children: [
                          InkWell(
                              onTap: () => Navigator.of(context).pop(true),
                              child: const Icon(Icons.arrow_back, size: 30)),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Labels.lg(
                                text: 'Reset Password',
                                textColor: context.resources.color.textPrimary,
                              )),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text("Reset Password")),
                      const SizedBox(height: 60),
                      const TextFields.text(
                        hintText: 'Email Address',
                      ),
                      const SizedBox(height: 70),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Buttons(
                            onTap: _resetPassword,
                            text: "SEND LINK",
                            color: context.resources.color.colorAccent,
                            textColor: context.resources.color.textSecondary,
                          )),
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

  void _resetPassword() async {
    final backButton = await Navigator.of(context).push<bool?>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => const ResetPassword(),
      ),
    );
    if (backButton == null || backButton == false) {
      if (mounted) Navigator.of(context).pop();
    }
  }
}
