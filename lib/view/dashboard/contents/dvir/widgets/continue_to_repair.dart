import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/styles/widgets/labels.dart';
import '../../../../../styles/styles.dart';
import '../../../../../styles/widgets/buttons.dart';

class ContinueToRepairWidget extends StatefulWidget {
  const ContinueToRepairWidget({super.key});

  @override
  State<ContinueToRepairWidget> createState() => _ContinueToRepairWidgetState();
}

class _ContinueToRepairWidgetState extends State<ContinueToRepairWidget> {
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
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Labels.md(
                  text: 'YOU SELECTED',
                  textColor: context.resources.color.textPrimary,
                ),
              ),
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
                  onTap: () {},
                  text: "SUBMIT",
                  color: context.resources.color.colorAccent,
                  textColor: context.resources.color.textSecondary,
                ))
          ],
        ),
      ),
    );
  }
}
