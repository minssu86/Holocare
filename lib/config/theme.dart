import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Color(0xFF171717),
      fontSize: 28,
    ),
    titleMedium: TextStyle(
      color: Color(0xFF171717),
      fontSize: 28,
    ),
    bodyLarge: TextStyle(),
  ));
}

class TextStyles {
  static const title1 = TextStyle(
    fontSize: 28,
    color: ColorStyles.gray_01,
    fontWeight: FontWeight.w700,
  );
  static const title2 = TextStyle(
    fontSize: 22,
    color: ColorStyles.gray_01,
    fontWeight: FontWeight.w700,
  );
  static const title3 = TextStyle(
    fontSize: 20,
    color: ColorStyles.gray_01,
    fontWeight: FontWeight.w700,
  );
  static const body1 = TextStyle(
    fontSize: 17,
    color: ColorStyles.gray_01,
  );
  static const body1Strong = TextStyle(
    fontSize: 17,
    color: ColorStyles.gray_01,
    fontWeight: FontWeight.w700,
  );
  static const body2 = TextStyle(
    fontSize: 14,
    color: ColorStyles.gray_01,
  );
  static const body2Strong = TextStyle(
    fontSize: 14,
    color: ColorStyles.gray_01,
    fontWeight: FontWeight.w700,
  );
  static const caption1 = TextStyle(
    fontSize: 13,
    color: ColorStyles.gray_03,
    fontWeight: FontWeight.w400,
  );
  static const caption1Strong = TextStyle(
    fontSize: 13,
    color: ColorStyles.gray_01,
    fontWeight: FontWeight.w700,
  );
}

class ColorStyles {
  static const Color gray_01 = Color(0xFF171717);
  static const Color gray_02 = Color(0xFF3D3D3D);
  static const Color gray_03 = Color(0xFF8B8B8B);
  static const Color gray_04 = Color(0xFFDFDFDF);
  static const Color gray_05 = Color(0xFFF5F4F3);
  static const Color red_01 = Color(0xFFDE2C2C);
  static const Color red_02 = Color(0xFFFDDDDD);
  static const Color primary = Color(0xFF8D4BF6);
  static const Color secondary = Color(0xFFF6F1FC);
  static const Color white = Color(0xFFFFFFFF);
}
