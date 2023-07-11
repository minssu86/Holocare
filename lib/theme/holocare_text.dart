import 'package:flutter/material.dart';
import 'package:holocare/theme/font_size.dart';
import 'package:holocare/theme/h_color.dart';

class HolocareText {
  const HolocareText._({
    required this.h28,
    required this.h22,
    required this.h20,
    required this.b17,
    required this.b14,
    required this.c13,
  });

  factory HolocareText() {
    return const HolocareText._(
      h28: TextStyle(fontSize: FontSize.pt28),
      h22: TextStyle(fontSize: FontSize.pt22),
      h20: TextStyle(fontSize: FontSize.pt20),
      b17: TextStyle(fontSize: FontSize.pt17),
      b14: TextStyle(fontSize: FontSize.pt14),
      c13: TextStyle(fontSize: FontSize.pt13),
    );
  }

  final TextStyle h28;
  final TextStyle h22;
  final TextStyle h20;
  final TextStyle b17;
  final TextStyle b14;
  final TextStyle c13;
}

extension TextStyleExt on TextStyle {
  TextStyle bold() => copyWith(fontWeight: FontWeight.w700);
  TextStyle semiBold() => copyWith(fontWeight: FontWeight.w600);
  TextStyle white() => copyWith(color: HColor.white);
  TextStyle title() => copyWith(color: HColor.grayscale_01);
  TextStyle description() => copyWith(color: HColor.grayscale_03);
  TextStyle success() => copyWith(color: HColor.success);
  TextStyle caution() => copyWith(color: HColor.caution);
  TextStyle warning() => copyWith(color: HColor.warning);
}
