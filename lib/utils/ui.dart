import 'dart:math';

import 'package:base_project/utils/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class AppThemeData {
  static AppThemeData _appThemeData = AppThemeData._();
  final double textButtonBorderRadius =
      SizeConfig.sizeMultiplier.unitHeightMultiplier_12;
  final double textButtonFontSize =
      SizeConfig.sizeMultiplier.unitHeightMultiplier_12;
  final double textButtonPaddingHorizontal =
      SizeConfig.sizeMultiplier.unitWidthMultiplier_12;
  final double textButtonPaddingVertical =
      SizeConfig.sizeMultiplier.unitHeightMultiplier_12;


  ThemeData? generalThemeData;


  AppThemeData();
  static AppThemeData getInstance() {
     _appThemeData = AppThemeData.getThemeData(isDark:Constants.isDark);
     return _appThemeData;
  }
  AppThemeData._(){
    _appThemeData = AppThemeData.getThemeData();
  }

  factory AppThemeData.getThemeData({bool isDark = false}) {
    _AppColors appColors = _AppColors.getAppColors(isDark: isDark);
    AppThemeData newAppThemeData = AppThemeData();
    newAppThemeData.generalThemeData = ThemeData(
      scaffoldBackgroundColor: appColors.primaryColor,
      primaryColor: appColors.primaryColor,
      primaryColorLight: appColors.primaryColorLight,
      primaryColorDark: appColors.primaryColorDark,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0,
        backgroundColor: appColors.primaryColorDark,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor:
                  MaterialStateProperty.all<Color>(appColors.primaryColor))),
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorScheme: ColorScheme.fromSwatch(
              primarySwatch: getInstance()
                  .generateMaterialColor(appColors.primaryColorDark))
          .copyWith(secondary: appColors.primaryColorLight),
    );
    return newAppThemeData;
  }

  MaterialColor generateMaterialColor(Color color) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);


}

class _AppColors {
  final Color primaryColor;
  final Color primaryColorDark;
  final Color primaryColorLight;

  const _AppColors({
    required this.primaryColor,
    required this.primaryColorDark,
    required this.primaryColorLight,
  });

  factory _AppColors.getAppColors({bool isDark = false}) {
    final Color primaryColor =
        isDark ? const Color(0xFF303135) : const Color(0xFFFAFAFF);
    final Color primaryColorDark =
        isDark ? const Color(0xFF202125) : const Color(0xFF5C56D4);
    final Color primaryColorLight =
        isDark ? const Color(0xFFFFE500) : const Color(0xFF5C56D4);
    return _AppColors(
        primaryColor: primaryColor,
        primaryColorDark: primaryColorDark,
        primaryColorLight: primaryColorLight);
  }
}
