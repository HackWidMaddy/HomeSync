import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homesync/pages/login.dart';

class Flashscreen extends StatefulWidget {
  const Flashscreen({super.key});

  @override
  State<Flashscreen> createState() => _FlashscreenState();
}

class _FlashscreenState extends State<Flashscreen>
    with SingleTickerProviderStateMixin {
  @override
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SignInScreen()), // Navigate to SignInScreen widget
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can replace 'splashscreen.png' with your actual splash screen image path
            Image.asset(
              'assets/splash.png',
              width: 500, // Adjust the width as needed
              height: 700, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
