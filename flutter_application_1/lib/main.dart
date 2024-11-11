import 'package:flutter/material.dart';
import 'package:flutter_application_1/Q61/q61.dart';
import 'package:flutter_application_1/Q72/q72.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  PhoneCallApp(),
    );
  }
}
