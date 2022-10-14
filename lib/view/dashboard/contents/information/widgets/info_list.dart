import 'package:flutter/material.dart';
import 'package:untitled/models/informationModel.dart';
import 'package:untitled/styles/AppContextExtension.dart';
import '../../../../../styles/widgets/labels.dart';

class InfoWidget extends StatelessWidget {
  final InformationModel info;

  const InfoWidget({
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(context.resources.label.rectangle),
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Labels.md(
                    text: info.title,
                    textColor: context.resources.color.textPrimary,
                  ),
                  Container(
                    child: const Labels.sm(text: "Oct 10, 2022"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
