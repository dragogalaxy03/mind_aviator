import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv/Dashboard/Home_dashboard/tv_carousel_screen.dart';
import 'package:tv/Login%20Screen/login_screen.dart';
import 'package:tv/Use%20Json/Json_Splash_Screen/json_splash_screen.dart';
import 'package:tv/Use%20Json/Json_Splash_Screen/next_screen.dart';
import 'Splash_Screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedLogo = prefs.getString('user_logo') ?? 'images/mindaviator.png';

  runApp(

      MyApp(savedLogo: savedLogo)

  );
}

class MyApp extends StatelessWidget {
  final String savedLogo;

  MyApp({required this.savedLogo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NextScreen(),
    );
  }
}