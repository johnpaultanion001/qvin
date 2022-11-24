import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

import '../../../../../styles/widgets/labels.dart';

class SelectProblem extends StatefulWidget {
  @override
  _SelectProblemState createState() => _SelectProblemState();
}

class _SelectProblemState extends State<SelectProblem> {
  bool? check = false;

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SELECT THE PROBLEM',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 8),
              Divider(
                color: context.resources.color.colorPrimary,
                thickness: 1,
              ),
              CheckboxListTile(
                value: check,
                controlAffinity:
                    ListTileControlAffinity.leading, //checkbox at left
                onChanged: (bool? value) {
                  setState(() {
                    check = value;
                  });
                },
                title: const Labels.sm(
                  text: 'BRAKE',
                ),
              ),
              Divider(
                color: context.resources.color.colorPrimary,
                thickness: 1,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Air Lines',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Battery',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Brake Accessories',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Brake',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Carburetor',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Clutch',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Clutch',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Tires',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Transmission',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Wheels',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Windows',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Windshield Wipers',
                      ),
                    ),
                    Divider(
                      color: context.resources.color.colorPrimary,
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: check,
                      controlAffinity:
                          ListTileControlAffinity.leading, //checkbox at left
                      onChanged: (bool? value) {
                        setState(() {
                          check = value;
                        });
                      },
                      title: const Labels.sm(
                        text: 'Other',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
