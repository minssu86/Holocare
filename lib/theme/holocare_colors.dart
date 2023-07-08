import 'package:flutter/material.dart';
import 'package:holocare/theme/h_color.dart';

class HolocareColors {
  const HolocareColors._({
    required this.primary,
    required this.primarySecondary,
    required this.success,
    required this.warning,
    required this.warningSecondary,
    required this.grayscale_100,
    required this.grayscale_50,
    required this.grayscale_25,
    required this.grayscale_00,
  });

  factory HolocareColors() {
    return const HolocareColors._(
      primary: HColor.primary,
      primarySecondary: HColor.primarySecondary,
      success: HColor.success,
      warning: HColor.warning,
      warningSecondary: HColor.warningSecondary,
      grayscale_100: HColor.grayscale_100,
      grayscale_50: HColor.grayscale_50,
      grayscale_25: HColor.grayscale_25,
      grayscale_00: HColor.grayscale_00,
    );
  }

  final Color primary;
  final Color primarySecondary;
  final Color success;
  final Color warning;
  final Color warningSecondary;
  final Color grayscale_100;
  final Color grayscale_50;
  final Color grayscale_25;
  final Color grayscale_00;
}
