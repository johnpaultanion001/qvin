import 'package:flutter/cupertino.dart';
import 'package:untitled/styles/Resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}
