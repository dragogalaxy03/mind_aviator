import 'dart:io';
import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tv/Constant/app_url.dart';
import '../../Login Screen/login_screen.dart';
import '../../Constant/const_var.dart';
// Import your login screen

class NextScreen extends StatefulWidget {
  const NextScreen({super.key});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  int selectedId = 1; // Default selected ID
  bool isLoading = true;
  String? responseMessage;
  Map<String, String> info = {};

  final List<Map<String, dynamic>> images = [
    {"id": 1, "path": "assets/images/mindaviator.png"},
    {"id": 2, "path": "assets/images/microsoft.png"},
    {"id": 3, "path": "assets/images/loqal.png"}
  ];

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, String> newInfo = {};

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      newInfo = {
        'device': androidInfo.device,
        'device_model': androidInfo.model,
        'osVersion': androidInfo.version.release,
        'serial': androidInfo.serialNumber ?? 'Unknown',
        'device_id': androidInfo.id,
        'asset_type': androidInfo.type,
      };
    }

    if (mounted) {
      setState(() {
        info = newInfo;
      });

      // Once device info is fetched, send it to API
      await _sendDeviceData();
    }
  }

  Future<void> _sendDeviceData() async {
    final url = Uri.parse(AppUrl.SETUP_DEVICE);
    final headers = {
      "Content-Type": "application/json",

    };
    final body = jsonEncode(info);

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        responseMessage = "";
        print('✅ API Response: ${response.body}');
      } else {
        responseMessage = "❌ API Error: ${response.statusCode}";
        print('❌ API Error: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      responseMessage = "🚨 Network Error: $error";
      print('🚨 Network Error: $error');
    } finally {
      if (mounted) {
        setState(() => isLoading = false);

        // Navigate to Login Screen after API call
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()), // Navigate to Login Screen
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedImagePath = images.firstWhere(
          (image) => image['id'] == selectedId,
      orElse: () => {"path": "assets/images/mindaviator.png"},
    )['path'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator() // Show loading while processing API request
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //const Text("Select an Image:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            // Dropdown to Select Image
            // DropdownButton<int>(
            //   value: selectedId,
            //   onChanged: (int? newValue) {
            //     if (newValue != null) {
            //       setState(() {
            //         selectedId = newValue;
            //       });
            //     }
            //   },
            //   items: images.map<DropdownMenuItem<int>>((image) {
            //     return DropdownMenuItem<int>(
            //       value: image['id'],
            //       child: Text('ID: ${image['id']}'),
            //     );
            //   }).toList(),
            // ),
            // const SizedBox(height: 20),

            // Display Selected Image
            Image.asset(selectedImagePath, width: 250, height: 250, fit: BoxFit.contain),
            const SizedBox(height: 20),

            // API Response Message
            if (responseMessage != null)
              Text(
                responseMessage!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: responseMessage!.contains("✅") ? Colors.green : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
