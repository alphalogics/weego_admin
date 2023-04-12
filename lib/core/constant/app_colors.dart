import 'package:flutter/material.dart';


const Color kcMediumGreyColor = Color(0xFF868686);
const Color kcMediumLightGreyColor = Color(0xffB0B0AF);
const Color kcLightGreyColor = Color(0xFFe5e5e5);
const Color kcVeryLightGreyColor = Color(0xFFF2F2F2);
const Color kcBlackColor = Color(0xFF000000);
const Color kcWhiteColor = Color(0xFFFFFFFF);
const Color kcLinkColor = Color(0xFF4E60FF);
const Color kcErrorColor = Colors.red;
const Color kcBlueGrey = Colors.blueGrey;

const Color kcBackgroundColor = Color(0xFFF5F7F9);

const Color kcStatusFreeColor = Color(0xFF1B792D);
const Color kcStatusWaitlistColor = Color(0xFFE29E43);

const Color kcPrimaryColor = Color(0xff2974FF);
const Color kcSecondaryColor = Color(0xff5B82BD);
const Color kcAppBarColor = kcPrimaryColor;

// const Color kcNonSelectedGrey = Color(0xffB0B0AF);

final MaterialColor kcPrimaryMaterialColor =
    _factoryColor(kcPrimaryColor.value);

// Utils
MaterialColor hex(String hex) => _factoryColor(_getColorHexFromStr(hex));

MaterialColor _factoryColor(int color) {
  return MaterialColor(color, <int, Color>{
    50: Color(color),
    100: Color(color),
    200: Color(color),
    300: Color(color),
    400: Color(color),
    500: Color(color),
    600: Color(color),
    700: Color(color),
    800: Color(color),
    900: Color(color),
  });
}

int _getColorHexFromStr(String colorStr) {
  colorStr = "FF" + colorStr;
  colorStr = colorStr.replaceAll("#", "");
  int val = 0;
  int len = colorStr.length;
  for (int i = 0; i < len; i++) {
    int hexDigit = colorStr.codeUnitAt(i);
    if (hexDigit >= 48 && hexDigit <= 57) {
      val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 65 && hexDigit <= 70) {
// A..F
      val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
    } else if (hexDigit >= 97 && hexDigit <= 102) {
// a..f
      val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
    } else {
      val = 0xFFFFFFFF;
    }
  }
  return val;
}
