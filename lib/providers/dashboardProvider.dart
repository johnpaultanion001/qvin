// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum Dvir {
  Visual,
  Form,
}

class DashboardProvider with ChangeNotifier {
  Dvir _dvir = Dvir.Visual;
  late bool _isForm = true;

  bool get isForm => _isForm;
  Dvir get dvir => _dvir;

  isFormDVIR() async {
    if (_isForm == true) {
      _isForm = false;
      _dvir = Dvir.Form;
    } else {
      _isForm = true;
      _dvir = Dvir.Visual;
    }
    notifyListeners();
  }
}
