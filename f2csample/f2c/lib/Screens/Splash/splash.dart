import 'dart:async';

import 'package:f2c/Screens/Auth/Login.dart';
import 'package:f2c/Screens/Auth/signup.dart';
import 'package:f2c/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => Get.offAll(() => LoginPage()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Green.png'),
      ),
    );
  }
}
