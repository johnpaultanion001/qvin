import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import 'package:untitled/view/dashboard/contents/dvir/dvir_form.dart';
import 'package:untitled/view/dashboard/contents/dvir/dvir_visual.dart';

class DVIR extends StatefulWidget {
  int selectedItem;
  DVIR({
    Key? key,
    this.selectedItem = 0,
  });

  @override
  State<DVIR> createState() => _DVIRState();
}

class _DVIRState extends State<DVIR> {
  static const List<Widget> _widgetOptions = <Widget>[
    DVIRVisual(),
    DVIRForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _widgetOptions.elementAt(widget.selectedItem),
      ],
    );
  }
}
