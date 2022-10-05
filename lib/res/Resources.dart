// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'colors/AppColors.dart';
import 'labels/AppLabels.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  AppColors get color {
    return AppColors();
  }

  AppLabels get label {
    return AppLabels();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
