import 'package:flutter/material.dart';
import 'package:qvin/styles/widgets/labels.dart';

class NotificationText extends StatelessWidget {
  final String? text;
  final String? type;

  const NotificationText(this.text, {this.type, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red;

    if ('info' == type) {
      color = Colors.blue;
    }

    return Labels.sm(
      text: text!,
      textColor: color,
    );
  }
}
