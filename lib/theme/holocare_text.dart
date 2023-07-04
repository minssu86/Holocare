import 'package:flutter/material.dart';
import 'package:holocare/theme/font_size.dart';

class HolocareText {
  const HolocareText._({
    required this.h24,
    required this.h16,
    required this.b14,
  });

  factory HolocareText() {
    return const HolocareText._(
      h24: TextStyle(fontSize: FontSize.pt24),
      h16: TextStyle(fontSize: FontSize.pt24),
      b14: TextStyle(fontSize: FontSize.pt24),
    );
  }

  final TextStyle h24;
  final TextStyle h16;
  final TextStyle b14;
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
}
