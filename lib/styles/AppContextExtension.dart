import 'package:flutter/cupertino.dart';
import 'package:qvin/styles/Resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}
