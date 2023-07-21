import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:holocare/theme/h_color.dart';

@immutable
class Constants {
  const Constants._({
    required this.iosApiKey,
    required this.iosAppId,
    required this.iosMessagingSenderId,
    required this.iosProjectId,
    required this.iosStorageBucket,
    required this.iosClientId,
    required this.iosBundleId,
    required this.androidApiKey,
    required this.androidAppId,
    required this.androidMessagingSenderId,
    required this.androidProjectId,
    required this.androidStorageBucket,
  });

  factory Constants() {
    return Constants._(
      iosApiKey: dotenv.env['IOS_API_KEY']!,
      iosAppId: dotenv.env['IOS_APP_ID']!,
      iosMessagingSenderId: dotenv.env['IOS_MESSAGING_SENDER_ID']!,
      iosProjectId: dotenv.env['IOS_PROJECT_ID']!,
      iosStorageBucket: dotenv.env['IOS_STORAGE_BUCKET']!,
      iosClientId: dotenv.env['IOS_CLIENT_ID']!,
      iosBundleId: dotenv.env['IOS_BUNDLE_ID']!,
      androidApiKey: dotenv.env['ANDROID_API_KEY']!,
      androidAppId: dotenv.env['ANDROID_APP_ID']!,
      androidMessagingSenderId: dotenv.env['ANDROID_MESSAGING_SENDER_ID']!,
      androidProjectId: dotenv.env['ANDROID_PROJECT_ID']!,
      androidStorageBucket: dotenv.env['ANDROID_STORAGE_BUCKET']!,
    );
  }

  static final Constants instance = Constants();

  final String iosApiKey;
  final String iosAppId;
  final String iosMessagingSenderId;
  final String iosProjectId;
  final String iosStorageBucket;
  final String iosClientId;
  final String iosBundleId;

  final String androidApiKey;
  final String androidAppId;
  final String androidMessagingSenderId;
  final String androidProjectId;
  final String androidStorageBucket;
}

enum Role {
  protector(role: "protector"),
  protege(role: "protege");

  const Role({
    required this.role,
  });

  final String role;
}

enum SettingItemType {
  arrowBtn,
  switchBtn;
}

enum ActiveLevel {
  success(
    level: 11,
    textStyle: TextStyle(
      color: HColor.success,
      fontWeight: FontWeight.w600,
    ),
    background: HColor.successSecondary,
    text: "안전",
    title: "안전하게\n보호하고 있어요",
    image: "buddy_safety.png",
  ),
  caution(
    level: 23,
    textStyle: TextStyle(
      color: HColor.caution,
      fontWeight: FontWeight.w600,
    ),
    background: HColor.cautionSecondary,
    text: "주의",
    title: "주의가\n필요해요",
    image: "buddy_caution.png",
  ),
  warning(
    level: 24,
    textStyle: TextStyle(
      color: HColor.warning,
      fontWeight: FontWeight.w600,
    ),
    background: HColor.warningSecondary,
    text: "위험",
    title: "위험할 수 있는\n상황이에요",
    image: "buddy_warning.png",
  ),
  pause(
    level: double.infinity,
    textStyle: TextStyle(
      color: HColor.grayscale_02,
      fontWeight: FontWeight.w600,
    ),
    background: HColor.grayscale_04,
    text: "보호 중지",
    title: "보호가\n중지되었어요",
    image: "buddy_pause.png",
  );

  const ActiveLevel({
    required this.level,
    required this.textStyle,
    required this.background,
    required this.title,
    required this.text,
    required this.image,
  });

  final num level;
  final TextStyle textStyle;
  final Color background;
  final String title;
  final String text;
  final String image;
}
