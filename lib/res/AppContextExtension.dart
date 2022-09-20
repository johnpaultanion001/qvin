
import 'package:flutter/cupertino.dart';
import 'package:untitled/res/Resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}

