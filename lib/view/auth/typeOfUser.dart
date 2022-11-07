// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import '../../../styles/widgets/buttons.dart';
import '../../styles/widgets/logo.dart';
import 'signUp.dart';

class TypeOfUser extends StatefulWidget {
  const TypeOfUser({Key? key}) : super(key: key);

  @override
  State<TypeOfUser> createState() => _TypeOfUserState();
}

class _TypeOfUserState extends State<TypeOfUser> {
  int? _selectedValueIndex;
  String? _selectedType;
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
          _selectedType = buttonText[index];
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
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: context.resources.color.colorPrimary,
        ),
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            Container(
              height: 164,
              width: double.maxFinite,
              child: const Logo(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.resources.color.textSecondary,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: context.resources.color.boxShadow,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Center(
                      child: Material(
                        type: MaterialType.transparency,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Labels.lg(
                                  text: "Type Of Users",
                                  textColor:
                                      context.resources.color.textPrimary,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...List.generate(
                                      buttonText.length,
                                      (index) => button(
                                        index: index,
                                        text: buttonText[index],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    child: Buttons(
                                      onTap: _signup,
                                      text: "CONTINUE",
                                      color:
                                          context.resources.color.colorAccent,
                                      textColor:
                                          context.resources.color.textSecondary,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signup() async {
    String typeOfUser = _selectedType!.replaceAll(RegExp(' '), '_');
    print(typeOfUser.toLowerCase());
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUp(typeOfUser: typeOfUser.toLowerCase()),
    ));
  }
}
