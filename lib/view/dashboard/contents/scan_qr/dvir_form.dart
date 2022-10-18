import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/styles/AppContextExtension.dart';

import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';

class DVIRForm extends StatefulWidget {
  const DVIRForm({super.key});

  @override
  State<DVIRForm> createState() => _DVIRFormState();
}

class _DVIRFormState extends State<DVIRForm> {
  bool? check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRIOR DVIR FORM'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Labels.sm(
                    text: 'Date: Jan 20th, 2023',
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: 'Truck/Tractor No: D0121221212',
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: 'Flagged:',
                  ),
                  const Labels.sm(
                    text: 'Air Compressor',
                  ),
                  const Labels.sm(
                    text: 'Front Axie:',
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: 'Trailer No: D0121221212',
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: 'Flagged:',
                  ),
                  const Labels.sm(
                    text: 'Brake Connections',
                  ),
                  const Labels.sm(
                    text: 'Tires',
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: 'Remarks',
                  ),
                  const Labels.sm(
                    text:
                        'Lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum ',
                  ),
                  const SizedBox(height: 5),
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
                      text: 'Above Defects Corrected',
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: "Mechanic's Signature:",
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(context.resources.label.rectangle),
                      ),
                    ),
                  ),
                  const Labels.sm(
                    text: 'Date: 08/22/2023',
                  ),
                  const SizedBox(height: 5),
                  const Labels.sm(
                    text: "Driver's Signature:",
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: 60,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage(context.resources.label.rectangle),
                      ),
                    ),
                  ),
                  const Labels.sm(
                    text: 'Date: 08/22/2023',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(1),
                child: Buttons(
                  onTap: () {},
                  text: "ACCEPT THIS DVIR",
                  color: context.resources.color.colorAccent,
                  textColor: context.resources.color.textSecondary,
                )),
          ),
        ],
      ),
    );
  }
}
