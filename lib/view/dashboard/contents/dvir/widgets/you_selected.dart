import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';
import 'package:qvin/view/dashboard/contents/dvir/widgets/continue_to_repair.dart';
import 'package:qvin/view/dashboard/contents/dvir/widgets/select_problem.dart';

import '../../../../../styles/styles.dart';
import '../../../../../styles/widgets/buttons.dart';

class YouSelectedWidget extends StatefulWidget {
  const YouSelectedWidget({super.key});

  @override
  State<YouSelectedWidget> createState() => _YouSelectedWidgetState();
}

class _YouSelectedWidgetState extends State<YouSelectedWidget> {
  bool? check = true;
  bool? isComplete = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            isComplete == false ? youSelected(context) : remarksRepair(context),
      ),
    );
  }

  Column youSelected(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          controlAffinity: ListTileControlAffinity.leading, //checkbox at left
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
          controlAffinity: ListTileControlAffinity.leading, //checkbox at left
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
          controlAffinity: ListTileControlAffinity.leading, //checkbox at left
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
        Buttons(
          onTap: () {
            setState(() {
              isComplete = true;
            });
          },
          text: "CONTINUE TO REPAIR",
          color: context.resources.color.colorAccent,
          textColor: context.resources.color.textSecondary,
        )
      ],
    );
  }

  Column remarksRepair(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 15),
        const Labels.md(
          text: 'Springs',
        ),
        const SizedBox(height: 12),
        const Labels.md(
          text: 'Tarpaulin',
        ),
        const SizedBox(height: 12),
        const Labels.md(
          text: 'Tires',
        ),
        const SizedBox(height: 12),
        CheckboxListTile(
          value: check,
          controlAffinity: ListTileControlAffinity.leading, //checkbox at left
          onChanged: (bool? value) {
            setState(() {
              check = value;
            });
          },
          title: const Labels.md(
            text: 'ABOVE DEFECTS CORRECTED',
          ),
        ),
        const SizedBox(height: 8),
        CheckboxListTile(
          value: check,
          controlAffinity: ListTileControlAffinity.leading, //checkbox at left
          onChanged: (bool? value) {
            setState(() {
              check = value;
            });
          },
          title: const Labels.md(
            text:
                'ABOVE DEFECTS NEED NOT BE CORRECTED FOR SAFE OPERATION OF VEHICLE',
          ),
        ),
        const SizedBox(height: 16),
        const Labels.md(
          text: "Mechanic's Signature:",
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 2,
          decoration: Styles.input,
        ),
        const SizedBox(height: 8),
        const Labels.sm(
          text: "Date: 08/22/2023",
        ),
        const SizedBox(height: 16),
        const Labels.md(
          text: "Driver's Signature:",
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: 2,
          decoration: Styles.input,
        ),
        const SizedBox(height: 8),
        const Labels.sm(
          text: "Date: 08/22/2023",
        ),
        const SizedBox(height: 8),
        Buttons(
          onTap: () {
            setState(() {
              //ContinueToRepairWidget();
            });
          },
          text: "ADD MECHANIC RECEIPT",
          color: context.resources.color.colorAccent,
          textColor: context.resources.color.textSecondary,
        ),
        const SizedBox(height: 8),
        Buttons(
          onTap: () {
            setState(() {
              //ContinueToRepairWidget();
            });
          },
          text: "FINISH DVIR",
          color: context.resources.color.colorAccent,
          textColor: context.resources.color.textSecondary,
        )
      ],
    );
  }
}
