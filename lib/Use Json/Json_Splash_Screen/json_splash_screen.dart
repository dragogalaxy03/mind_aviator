import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'next_screen.dart';

class JsonSplashScreen extends StatefulWidget {
  const JsonSplashScreen({super.key});

  @override
  State<JsonSplashScreen> createState() => _JsonSplashScreenState();
}

class _JsonSplashScreenState extends State<JsonSplashScreen> {
  int selectedId = 1; // Default selected ID

  final List<Map<String, dynamic>> images = [
    {"id": 1, "path": "assets/images/mindaviator.png"},
    {"id": 2, "path": "assets/images/microsoft.png"},
    {"id": 3, "path": "assets/images/loqal.png"}
  ];


  @override
  void initState() {
    super.initState();


    // Navigate to another screen after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NextScreen()), // Replace with your target screen
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    String selectedImagePath = images.firstWhere(
          (image) => image['id'] == selectedId,
      orElse: () => {"path": "assets/images/mindaviator.png"},
    )['path'];

    return Scaffold(
      appBar: AppBar(title: const Text('Select Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),), backgroundColor: Colors.white,),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Select an Image:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),

          // Dropdown to Select Image
          Center(
            child: DropdownButton<int>(
              value: selectedId,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedId = newValue;
                  });
                }
              },
              items: images.map<DropdownMenuItem<int>>((image) {
                return DropdownMenuItem<int>(
                  value: image['id'],
                  child: Text('ID: ${image['id']}'),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),

          // Display Selected Image
          Center(
            child: Image.asset(selectedImagePath, width: 150, height: 150, fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),


        ],
      ),
    );
  }
}
