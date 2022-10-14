import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/styles/AppContextExtension.dart';

class TextFields extends StatelessWidget {
  final String? hintText;

  const TextFields.text({
    Key? key,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          hintStyle: const TextStyle(fontFamily: "WorkSansLight"),
          filled: true,
          fillColor: context.resources.color.textDark,
          hintText: hintText),
    );
  }
}
