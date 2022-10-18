import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/styles/widgets/labels.dart';

import '../../../../../models/informationModel.dart';
import '../../../../../styles/styles.dart';
import '../../../../../styles/widgets/buttons.dart';

// ignore: must_be_immutable
class InfoAddEdit extends StatelessWidget {
  final InformationModel info;

  InfoAddEdit(this.info, {Key? key}) : super(key: key);

  bool? check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DOCUMENT ADD/EDIT',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        backgroundColor: context.resources.color.colorPrimary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(context.resources.label.rectangle),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Labels.md(text: "DOCUMENT NAME:"),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: Styles.input,
                            initialValue: info.title,
                          ),
                          const SizedBox(height: 10),
                          const Labels.md(text: "EXPIRATION:"),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: Styles.input,
                            initialValue: 'Oct 10, 2022',
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Buttons(
                  onTap: () {},
                  text: "SAVE",
                  color: context.resources.color.colorAccent,
                  textColor: context.resources.color.textSecondary,
                )),
          ),
        ],
      ),
    );
  }
}
