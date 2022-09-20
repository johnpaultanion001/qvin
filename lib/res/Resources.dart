
import 'package:flutter/cupertino.dart';
import '../res/colors/AppColors.dart';

class Resources {

  final BuildContext _context;

  Resources(this._context);

  /*Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'bn':
        return BanglaStrings();
      default:
        return EnglishStrings();
    }
  }*/

  /*AppDimension get dimension {
    return AppDimension();
  }*/

  AppColors get color {
    return AppColors();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }

}