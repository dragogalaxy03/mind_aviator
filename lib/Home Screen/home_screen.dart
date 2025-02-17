import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';// Restart the app with new logo

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String currentLogo = 'images/mindaviator.png'; // Default logo

  @override
  void initState() {
    super.initState();
    _loadCurrentLogo();
  }

  // Load last selected logo
  Future<void> _loadCurrentLogo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentLogo = prefs.getString('user_logo') ?? 'images/mindaviator.png';
    });
  }

  // Save new logo selection and restart the app
  Future<void> _setUserLogo(String logo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_logo', logo);

    // Restart app to apply new splash screen logo
    runApp(MyApp(savedLogo: logo));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Your Logo")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Current Logo:", style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Image.asset(currentLogo, width: 100),

          SizedBox(height: 20),
          Text("Choose a new logo:", style: TextStyle(fontSize: 18)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _setUserLogo('images/loqal.png'),
                child: Image.asset('images/loqal.png', width: 80),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => _setUserLogo('images/microsoft.png'),
                child: Image.asset('images/microsoft.png', width: 80),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => _setUserLogo('images/mindaviator.png'),
                child: Image.asset('images/mindaviator.png', width: 80),
              ),
            ],
          ),
        ],
      ),
    );
  }
}