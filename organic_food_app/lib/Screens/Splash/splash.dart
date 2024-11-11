import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organic_food_app/Screens/Auth/Login.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginPage after 3 seconds
    Timer(Duration(seconds: 2), () => Get.offAll(() => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Green Bite.gif'), // Display GIF
      ),
    );
  }
}
