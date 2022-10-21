import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/styles/widgets/labels.dart';
import 'package:untitled/view/dashboard/contents/dvir/widgets/continue_to_repair.dart';
import 'package:untitled/view/dashboard/contents/dvir/widgets/select_problem.dart';

import '../../../../../styles/styles.dart';
import '../../../../../styles/widgets/buttons.dart';

class YouSelectedWidget extends StatefulWidget {
  const YouSelectedWidget({super.key});

  @override
  State<YouSelectedWidget> createState() => _YouSelectedWidgetState();
}

class _YouSelectedWidgetState extends State<YouSelectedWidget> {
  bool? check = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Labels.md(
                  text: 'YOU SELECTED',
                  textColor: context.resources.color.textPrimary,
                ),
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
              title: const Labels.md(
                text: 'Springs',
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
              title: const Labels.md(
                text: 'Tarpaulin',
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
              title: const Labels.md(
                text: 'Tires',
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              color: context.resources.color.colorPrimary,
              thickness: 1,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Labels.md(
                  text:
                      'PLEASE DESCRIBE THE PROBLEMS AND/OR ROADSIDE REPAIR (IF ANY):',
                  textColor: context.resources.color.textPrimary,
                ),
              ),
            ),
            TextFormField(
              maxLines: 3,
              decoration: Styles.input,
            ),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Buttons(
                  onTap: () {
                    setState(() {
                      //ContinueToRepairWidget();
                    });
                  },
                  text: "CONTINUE TO REPAIR",
                  color: context.resources.color.colorAccent,
                  textColor: context.resources.color.textSecondary,
                ))
          ],
        ),
      ),
    );
  }
}
