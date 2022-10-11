import 'package:flutter/material.dart';
import 'package:untitled/res/AppContextExtension.dart';
import '../../../../widgets/buttons.dart';
import '../../../../widgets/labels.dart';
import '../../../../widgets/logo.dart';
import '../../../../widgets/textField.dart';
import '../../dashboard.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _InformationState();
}

class _InformationState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            decoration: BoxDecoration(
              color: context.resources.color.colorWhite,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Align(
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
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Labels.sm(
                                    text: 'Full Name',
                                    textColor:
                                        context.resources.color.colorLightGray,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.md(
                                    text: 'John Doe',
                                    textColor:
                                        context.resources.color.colorDark,
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                    color:
                                        context.resources.color.colorLightGray,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.sm(
                                    text: 'Company',
                                    textColor:
                                        context.resources.color.colorLightGray,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.md(
                                    text: 'Company Name',
                                    textColor:
                                        context.resources.color.colorDark,
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                    color:
                                        context.resources.color.colorLightGray,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.sm(
                                    text: 'DOT #',
                                    textColor:
                                        context.resources.color.colorLightGray,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.md(
                                    text: '1234567890',
                                    textColor:
                                        context.resources.color.colorDark,
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                    color:
                                        context.resources.color.colorLightGray,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.sm(
                                    text: 'Phone',
                                    textColor:
                                        context.resources.color.colorLightGray,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.md(
                                    text: '+02323323232',
                                    textColor:
                                        context.resources.color.colorDark,
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                    color:
                                        context.resources.color.colorLightGray,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.sm(
                                    text: 'Email',
                                    textColor:
                                        context.resources.color.colorLightGray,
                                  ),
                                  const SizedBox(height: 10),
                                  Labels.md(
                                    text: 'johndoe@gmail.com',
                                    textColor:
                                        context.resources.color.colorDark,
                                  ),
                                  const SizedBox(height: 10),
                                  Divider(
                                    color:
                                        context.resources.color.colorLightGray,
                                    thickness: 1,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(1),
                          child: Buttons(
                            onTap: () {},
                            text: "LOGOUT",
                            color: context.resources.color.colorAccent,
                            textColor: context.resources.color.textSecondary,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
