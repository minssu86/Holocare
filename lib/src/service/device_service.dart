import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';

class MemberService {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();
  // final FirebaseFirestore _memberCollection = FirebaseFirestore.instance;

  Future<String> getUserDeviceId() async {
    String deviceId = "";
    if (Platform.isIOS) {
      print("ios");
      final IosDeviceInfo iosData = await _deviceInfoPlugin.iosInfo;
      print("iosData : " + iosData.identifierForVendor);
      deviceId = iosData.identifierForVendor;
    } else {
      print("aos");
      final AndroidDeviceInfo aosData = await _deviceInfoPlugin.androidInfo;
      print("aosData : " + aosData.androidId);
      deviceId = aosData.androidId;
    }
    return deviceId;
  }

}