import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Splash_Screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLogo = prefs.getString('user_logo') ?? 'images/mindaviator.png';

  runApp(MyApp(savedLogo: savedLogo));
}

class MyApp extends StatelessWidget {
  final String savedLogo;

  MyApp({required this.savedLogo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(logoPath: savedLogo),
    );
  }
}