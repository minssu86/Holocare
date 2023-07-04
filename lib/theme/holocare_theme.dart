import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_colors.dart';
import 'package:holocare/theme/holocare_text.dart';

class HolocareTheme {
  HolocareTheme._({
    required this.data,
    required this.textTheme,
    required this.appColors,
  });

  factory HolocareTheme() {
    final holocareColors = HolocareColors();
    final themeData = ThemeData(
      scaffoldBackgroundColor: holocareColors.grayscale_00,
    );
    final holocareText = HolocareText();

    return HolocareTheme._(
      data: themeData,
      textTheme: holocareText,
      appColors: holocareColors,
    );
  }

  final ThemeData data;
  final HolocareText textTheme;
  final HolocareColors appColors;
}
