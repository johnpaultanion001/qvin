import 'package:flutter/material.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/styles/widgets/labels.dart';

import '../../../../styles/widgets/buttons.dart';
import '../../../../styles/widgets/logo.dart';

class TrailerNotFound extends StatelessWidget {
  const TrailerNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.resources.color.colorPrimary,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Expanded(
            flex: 3,
            child: Hero(
              tag: 'logo',
              child: Logo(),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Labels.md(
                    text: 'TRAILER NOT FOUND!',
                    textColor: context.resources.color.textSecondary,
                  ),
                  const SizedBox(height: 10),
                  Labels.md(
                    text:
                        'Please contact your company to confirm this is your trailer',
                    textColor: context.resources.color.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Buttons(
                  onTap: () {},
                  text: "ALL LOCATION MANAGER",
                  color: context.resources.color.colorAccent,
                  textColor: context.resources.color.textSecondary,
                )),
          ),
        ],
      )),
    );
  }
}
