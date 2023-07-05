import 'package:flutter/material.dart';
import 'package:holocare/theme/font_size.dart';
import 'package:holocare/theme/h_color.dart';

class HolocareText {
  const HolocareText._({
    required this.h24,
    required this.h16,
    required this.b14,
  });

  factory HolocareText() {
    return const HolocareText._(
      h24: TextStyle(fontSize: FontSize.pt24),
      h16: TextStyle(fontSize: FontSize.pt16),
      b14: TextStyle(fontSize: FontSize.pt14),
    );
  }

  final TextStyle h24;
  final TextStyle h16;
  final TextStyle b14;
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle primary() => copyWith(color: HColor.primary);
  TextStyle title() => copyWith(color: HColor.grayscale_100);
  TextStyle description() => copyWith(color: HColor.grayscale_50);
}
