import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // Save new logo selection
  Future<void> _setUserLogo(String logo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_logo', logo);

    setState(() {
      currentLogo = logo; // Update UI immediately
    });
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
          Image.asset(currentLogo, width: 100, errorBuilder: (context, error, stackTrace) {
            return Text("Image not found");
          }),

          SizedBox(height: 20),
          Text("Choose a new logo:", style: TextStyle(fontSize: 18)),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _setUserLogo('images/loqal.png'),
                child: Image.asset('images/loqal.png', width: 80, errorBuilder: (context, error, stackTrace) {
                  return Text("Image not found");
                }),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => _setUserLogo('images/microsoft.png'),
                child: Image.asset('images/microsoft.png', width: 80, errorBuilder: (context, error, stackTrace) {
                  return Text("Image not found");
                }),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => _setUserLogo('images/mindaviator.png'),
                child: Image.asset('images/mindaviator.png', width: 80, errorBuilder: (context, error, stackTrace) {
                  return Text("Image not found");
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
