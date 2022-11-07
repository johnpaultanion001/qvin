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
        content: Column(
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
                      text: 'BRAKE ACCESSORIES',
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
                      text: 'FRONT AXIE',
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
                      text: 'SPRINGS',
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
                      text: 'TIRES',
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
                      text: 'WHEELS',
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
                      text: 'OTHER',
                    ),
                  ),
                  Divider(
                    color: context.resources.color.colorPrimary,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
