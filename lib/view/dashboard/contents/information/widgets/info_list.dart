import 'package:flutter/material.dart';
import 'package:qvin/models/informationModel.dart';
import 'package:qvin/styles/AppContextExtension.dart';
import 'package:qvin/view/dashboard/contents/information/widgets/info_add_edit.dart';
import '../../../../../styles/widgets/labels.dart';

class InfoWidget extends StatelessWidget {
  final InformationModel info;

  const InfoWidget({
    required this.info,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoAddEdit(info)),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: context.resources.color.boxShadow,
                width: 3.0,
              ),
            ),
          ),
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
                    const Labels.sm(text: "Oct 10, 2022"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
