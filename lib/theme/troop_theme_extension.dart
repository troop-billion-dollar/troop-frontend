import 'package:flutter/material.dart';
import 'package:troop/theme/troop_theme.dart';
import 'package:troop_ui/troop_ui.dart';

extension BaseTextTheme on TextTheme {
  TextStyle get normalSize {
    return TextStyle(
      fontFamily: troopFontFamily,
      fontSize: 12,
      color: TroopColors.white,
    );
  }

  TextStyle get underlineStyle {
    return const TextStyle(
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.bold,
      color: Color(0xff5C59FF),
      fontSize: 15,
    );
  }
}
