// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';
import '../../../../styles/widgets/textField.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 550,
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
                        hintText: 'New Password',
                      ),
                      const SizedBox(height: 20),
                      const TextFields.text(
                        hintText: 'Confirm Password',
                      ),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Buttons(
                          onTap: () {},
                          text: "CONFIRM",
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
}
