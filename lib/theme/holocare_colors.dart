import 'package:flutter/material.dart';
import 'package:holocare/theme/h_color.dart';

class HolocareColors {
  const HolocareColors._({
    required this.primary,
    required this.primarySecondary,
    required this.success,
    required this.successSecondary,
    required this.caution,
    required this.cautionSecondary,
    required this.warning,
    required this.warningSecondary,
    required this.white,
    required this.grayscale_05,
    required this.grayscale_04,
    required this.grayscale_03,
    required this.grayscale_02,
    required this.grayscale_01,
  });

  factory HolocareColors() {
    return const HolocareColors._(
      primary: HColor.primary,
      primarySecondary: HColor.primarySecondary,
      success: HColor.success,
      successSecondary: HColor.successSecondary,
      caution: HColor.caution,
      cautionSecondary: HColor.cautionSecondary,
      warning: HColor.warning,
      warningSecondary: HColor.warningSecondary,
      white: HColor.white,
      grayscale_05: HColor.grayscale_05,
      grayscale_04: HColor.grayscale_04,
      grayscale_03: HColor.grayscale_03,
      grayscale_02: HColor.grayscale_02,
      grayscale_01: HColor.grayscale_01,
    );
  }

  final Color primary;
  final Color primarySecondary;
  final Color success;
  final Color successSecondary;
  final Color caution;
  final Color cautionSecondary;
  final Color warning;
  final Color warningSecondary;
  final Color white;
  final Color grayscale_05;
  final Color grayscale_04;
  final Color grayscale_03;
  final Color grayscale_02;
  final Color grayscale_01;
}
