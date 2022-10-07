// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/cupertino.dart';
import '../../../models/informationModel.dart';

class InfomationProvider extends ChangeNotifier {
  List<InformationModel> _infos = [
    InformationModel(
      title: "Registration",
      createdAt: DateTime.now(),
    ),
    InformationModel(
      title: "Annual Inspection",
      createdAt: DateTime.now(),
    ),
    InformationModel(
      title: "Insurance",
      createdAt: DateTime.now(),
    ),
  ];

  List<InformationModel> get infos => _infos.toList();
}
