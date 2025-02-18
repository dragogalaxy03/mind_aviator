import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

Future<void> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    debugPrint('Device Model: ${androidInfo.model}');
    debugPrint('OS Version: ${androidInfo.version.release}');
    debugPrint('Manufacturer: ${androidInfo.manufacturer}');
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    debugPrint('Device Model: ${iosInfo.utsname.machine}');
    debugPrint('OS Version: ${iosInfo.systemVersion}');
    debugPrint('Device Name: ${iosInfo.name}');
  }
}
