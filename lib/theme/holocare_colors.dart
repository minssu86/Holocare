import 'package:flutter/material.dart';

class HolocareColors {
  const HolocareColors._({
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.grayscale_100,
    required this.grayscale_50,
    required this.grayscale_25,
    required this.grayscale_00,
  });

  factory HolocareColors() {
    return const HolocareColors._(
      primary: Color(0xFFB41A7F),
      secondary: Color(0xFFF5E3EF),
      success: Color(0xFF66BB6A),
      warning: Color(0xFFF44336),
      grayscale_100: Color(0xFF000000),
      grayscale_50: Color(0xFF8C8C8C),
      grayscale_25: Color(0xFFF1F1F1),
      grayscale_00: Color(0xFFFFFFFF),
    );
  }

  final Color primary;
  final Color secondary;
  final Color success;
  final Color warning;
  final Color grayscale_100;
  final Color grayscale_50;
  final Color grayscale_25;
  final Color grayscale_00;
}
