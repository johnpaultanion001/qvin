// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SliderDesc extends StatelessWidget {
  String description;

  SliderDesc({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text(
                softWrap: true,
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }
}
