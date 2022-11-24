import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';

import '../../../../../styles/widgets/buttons.dart';
import '../../../../../styles/widgets/labels.dart';

class TrailerForm extends StatefulWidget {
  @override
  _TrailerFormState createState() => _TrailerFormState();
}

class _TrailerFormState extends State<TrailerForm> {
  bool? check = false;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Labels.sm(
                  text: 'TRAILER',
                  textColor: context.resources.color.colorPrimary,
                ),
                const Labels.sm(
                  text: 'DATE: Nov 21, 2022',
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Center(
              child: Labels.sm(
                text: 'Truck/Tractor: D031231231231',
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Labels.sm(
                text: 'CHECK THE PROBLEMS YOU FOUND:',
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
                text: 'Springs',
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
                      text: 'Tarpaulin',
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
                      text: 'Other',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Buttons(
                    onTap: () {},
                    text: "CONTINUE TO REMARKS",
                    color: context.resources.color.colorAccent,
                    textColor: context.resources.color.textSecondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
