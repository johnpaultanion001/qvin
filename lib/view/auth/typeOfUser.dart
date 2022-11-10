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
            const SizedBox(
              height: 164,
              width: double.maxFinite,
              child: Logo(),
            ),
            const SizedBox(height: 40),
            Expanded(
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
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () =>
                                          Navigator.pushNamed(context, '/auth'),
                                      child: const Icon(Icons.arrow_back,
                                          size: 30)),
                                  const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text("Type Of User",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Labels.sm(
                                  text:
                                      "Please select what you will be doing with QVIN and your experience will be customized.",
                                ),
                              ),
                              const SizedBox(height: 20),
                              SingleChildScrollView(
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
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Buttons(
                              onTap: _signup,
                              text: "CONTINUE",
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
