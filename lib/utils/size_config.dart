import 'dart:math';

import 'package:base_project/services/debugger_service.dart';
import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late double _screenWidth;

  static double get screenWidth => _screenWidth;
  static late double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  late double textMultiplier;
  late double imageSizeMultiplier;
  late double heightMultiplier;
  late double widthMultiplier;
  late bool isPortrait = true;
  late bool isMobilePortrait = false;

  static late _SizeMultiplier sizeMultiplier;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockWidth = _screenWidth / 100;
    _blockHeight = _screenHeight / 100;

    textMultiplier = _blockHeight;
    imageSizeMultiplier = _blockWidth;
    heightMultiplier = _blockHeight;
    widthMultiplier = _blockWidth;

    DebugLogger.getInstance().logD("MULTIPLIERS H:$heightMultiplier W:$widthMultiplier");

    sizeMultiplier =
        _SizeMultiplier(heightMultiplier, widthMultiplier, imageSizeMultiplier);
  }

  static double get screenHeight => _screenHeight;

  static double get blockWidth => _blockWidth;

  static double get blockHeight => _blockHeight;
}

class _SizeMultiplier {
  _SizeMultiplier(double heightMultiplier, double widthMultiplier,
      double imageSizeMultiplier) {
    unitHeightMultiplier__16 = min(16, heightMultiplier * 2.15);
    unitWidthMultiplier__16 = min(16, widthMultiplier * 4.15);
  }

  late double unitHeightMultiplier__16;
  late double unitWidthMultiplier__16;
}
