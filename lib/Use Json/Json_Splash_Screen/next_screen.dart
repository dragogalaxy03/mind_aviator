import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  Map<String, String> info = {};
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, String> newInfo = {};

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      newInfo = {
        'Device Model': androidInfo.model,
        'OS Version': androidInfo.version.release,
        'Manufacturer': androidInfo.manufacturer,
        'Display': androidInfo.display,
        'Brand': androidInfo.brand,
        'Hardware': androidInfo.hardware,
        'Host': androidInfo.host,
        'ID': androidInfo.id,
        'Product': androidInfo.product,
        'Bootloader': androidInfo.bootloader,
        'Device': androidInfo.device,
        'Board': androidInfo.board,
        'Fingerprint': androidInfo.fingerprint,
        'Supported ABIs': androidInfo.supportedAbis.join(", ")
      };
    }

    // Update state to reflect new device info
    if (mounted) {
      setState(() {
        info = newInfo;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Device Info")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const Text("Device Information:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...info.entries.map((entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text("${entry.key}: ${entry.value}", style: const TextStyle(fontSize: 16)),
            )),
          ],
        ),
      ),
    );
  }
}
