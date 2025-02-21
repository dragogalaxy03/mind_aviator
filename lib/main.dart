import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tv/Use%20Json/Json_Splash_Screen/next_screen.dart';
import 'Dashboard/Home_dashboard/tv_carousel_screen.dart';
import 'Home Screen/home_screen.dart';
import 'Login Screen/login_screen.dart';
import 'Provider/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
      ],
      child: MyApp(
        startScreen: isLoggedIn ? TVCarouselSlider() : LoginScreen(),
        savedLogo: 'images/mindaviator.png', // ✅ Correct usage
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String savedLogo; // ✅ Now it's properly initialized
  final Widget startScreen; // ✅ Accepts a Widget for the initial screen

  MyApp({required this.startScreen, this.savedLogo = 'images/mindaviator.png'}); // ✅ Fixed constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: startScreen, // ✅ Uses startScreen as the initial screen
    );
  }
}
