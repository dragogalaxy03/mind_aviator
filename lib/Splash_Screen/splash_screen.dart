import 'dart:async';
import 'package:flutter/material.dart';
import '../Home Screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  final String logoPath;

  SplashScreen({required this.logoPath});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(widget.logoPath, width: 200), // Load the saved logo
      ),
    );
  }
}