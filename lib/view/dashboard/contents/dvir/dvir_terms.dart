import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import '../../../../styles/styles.dart';
import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/labels.dart';
import '../../dashboard.dart';

class DVIRTerms extends StatefulWidget {
  const DVIRTerms({super.key});

  @override
  State<DVIRTerms> createState() => _DVIRTermsState();
}

class _DVIRTermsState extends State<DVIRTerms> {
  bool? check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRIO DVIR FORM',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: context.resources.color.colorPrimary,
        elevation: 0,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: context.resources.color.colorWhite),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    const Labels.md(
                      text: 'Date: Jan 20th, 2023',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const Labels.md(
                      text: 'Truck/Tractor No: D0121221212',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const Labels.md(
                      text: 'Flagged:',
                    ),
                    const Labels.md(
                      text: 'Air Compressor',
                    ),
                    const Labels.md(
                      text: 'Front Axie',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),
                    const Labels.md(
                      text: 'Trailer No: D0121221212',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const Labels.md(
                      text: 'Flagged:',
                    ),
                    const Labels.md(
                      text: 'Brake Connections',
                    ),
                    const Labels.md(
                      text: 'Tires',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const Labels.md(
                      text: 'Remarks',
                    ),
                    const Labels.md(
                      text:
                          'Hit a deer, air compressor has a horn in it, front axie tied up in carcass , cut brake connections with hoof and slashed front tire.',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
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
                        text: 'Above Defects Corrected',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const Labels.md(
                      text: "Mechanic's Signature:",
                    ),
                    TextFormField(
                      decoration: Styles.input,
                    ),
                    const SizedBox(height: 10),
                    const Labels.md(
                      text: 'Date: 08/22/2023',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),
                    const Labels.md(
                      text: "Driver's Signature:",
                    ),
                    TextFormField(
                      decoration: Styles.input,
                    ),
                    const SizedBox(height: 5),
                    const Labels.md(
                      text: 'Date: 08/22/2023',
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: context.resources.color.colorLightGray,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(5),
                child: Buttons(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Dashboard(
                              selectedItem: 1,
                            )),
                  ),
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
