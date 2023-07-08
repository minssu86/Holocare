import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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