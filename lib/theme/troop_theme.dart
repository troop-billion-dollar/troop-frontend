import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:troop/components/auth/presentation/auth.dart';

enum TroopFonts { regular, medium, bold }

final troopFontFamily = GoogleFonts.montserrat().fontFamily;

class TroopTheme {
  static ThemeData current() => _defaultTheme();

  static ThemeData _defaultTheme() {
    TextTheme _basicTypography(TextTheme base) {
      return base.copyWith(
        // Headline 1
        headline1: base.headline1?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 48,
          height: 1,
        ),
        // Headline2
        headline2: base.headline2?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 34,
          height: 1.1764705882,
        ),
        // Headline3
        headline3: base.headline3?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 24,
          height: 1.166666667,
        ),
        // Headline4
        headline4: base.headline4?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          height: 1.2,
        ),
        // Headline5
        headline5: base.headline5?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.w700,
          fontSize: 16,
          height: 1.25,
          letterSpacing: 0.02,
        ),
        // Headline6
        headline6: base.headline6?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 0.02,
          height: 1.1428571429,
          color: TroopColors.white,
        ),
        // Subtitle Medium
        subtitle1: base.subtitle1?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1.25,
        ),
        // Subtitle Small
        subtitle2: base.subtitle2?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 1.5,
        ),
        // Body1
        bodyText1: base.bodyText1?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          height: 1.5,
        ),
        // Body2 - body-small
        bodyText2: base.bodyText2?.copyWith(
            fontFamily: troopFontFamily,
            fontWeight: FontWeight.normal,
            fontSize: 14,
            letterSpacing: 0.0025,
            height: 1.42857),
        //Caption
        caption: base.caption?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          height: 1.1666666667,
          letterSpacing: 0.02,
        ),
        // Overline
        overline: base.overline?.copyWith(
          fontFamily: troopFontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          letterSpacing: 0.02,
        ),
      );
    }

    final ThemeData baseTheme = ThemeData();
    return baseTheme.copyWith(
      scaffoldBackgroundColor: const Color(0xff000321),
      appBarTheme: const AppBarTheme(color: Color(0xff000321)),
      primaryColor: const Color(0xff000321),
      textTheme: _basicTypography(baseTheme.textTheme),
    );
  }
}
