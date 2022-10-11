// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';
import 'package:untitled/widgets/labels.dart';
import '../../../widgets/buttons.dart';
import 'signUp.dart';

class TypeOfUser extends StatefulWidget {
  const TypeOfUser({Key? key}) : super(key: key);

  @override
  State<TypeOfUser> createState() => _TypeOfUserState();
}

class _TypeOfUserState extends State<TypeOfUser> {
  int? _selectedValueIndex;
  List<String> buttonText = [
    "ORG ADMIN",
    "LOCATION MANAGER",
    "DRIVER",
    "MECHANIC",
    "POLICE OFFICER",
  ];

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: context.resources.color.textSecondary,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(
                  color: context.resources.color.boxShadow, width: 0.75),
              color: index == _selectedValueIndex
                  ? context.resources.color.textPrimary
                  : context.resources.color.textSecondary,
              borderRadius: BorderRadius.circular(32)),
          child: Center(
            child: Text(text,
                style: TextStyle(
                    color: index == _selectedValueIndex
                        ? context.resources.color.textSecondary
                        : context.resources.color.textGray,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
        ),
      ),
    );
  }

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
            height: 600,
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
                          text: "Type Of Users",
                          textColor: context.resources.color.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 25),
                      ...List.generate(
                        buttonText.length,
                        (index) => button(
                          index: index,
                          text: buttonText[index],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Buttons(
                            onTap: _signup,
                            text: "CONTINUE",
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

  void _signup() async {
    final backButton = await Navigator.of(context).push<bool?>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        pageBuilder: (_, __, ___) => SignUp(),
      ),
    );
    if (backButton == null || backButton == false) {
      if (mounted) Navigator.of(context).pop();
    }
  }
}
