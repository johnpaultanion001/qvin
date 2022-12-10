import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qvin/providers/qrProvider.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';

import '../../../../../models/informationModel.dart';
import '../../../../../styles/styles.dart';
import '../../../../../styles/widgets/buttons.dart';

// ignore: must_be_immutable
class AddNewTrailer extends StatefulWidget {
  final String? qrCode;
  const AddNewTrailer({
    this.qrCode,
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewTrailer> createState() => _AddNewTrailerState();
}

class _AddNewTrailerState extends State<AddNewTrailer> {
  bool? check = true;
  String? trailer;
  List trailerLists = [];

  @override
  initState() {
    final profileProvider = Provider.of<QrProvider>(context, listen: false);
    profileProvider.getTrailerList();

    setState(() {
      trailerLists = profileProvider.getTrailerLists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADD NEW TRAILER',
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
                          const Labels.md(text: "Select Trailer:"),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              final profileProvider = Provider.of<QrProvider>(
                                  context,
                                  listen: false);
                              profileProvider.getTrailerList();

                              setState(() {
                                trailerLists = profileProvider.getTrailerLists;
                              });
                              print(trailerLists);
                            },
                            child: InputDecorator(
                              decoration: Styles.input.copyWith(
                                labelText: 'Select Trailer',
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: trailer,
                                  iconSize: 24,
                                  elevation: 16,
                                  isDense: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  isExpanded: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      trailer = newValue!;
                                    });
                                  },
                                  items: trailerLists.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item['name']),
                                      value: item['id'].toString(),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Labels.md(text: "Trailer Make:"),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: Styles.input,
                            initialValue: 'Allco',
                          ),
                          const SizedBox(height: 10),
                          const Labels.md(text: "Trailer Model:"),
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: Styles.input,
                            initialValue: 'Lowboy',
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              flex: 1,
              child: Buttons(
                onTap: () {},
                text: "SAVE",
                color: context.resources.color.colorAccent,
                textColor: context.resources.color.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
