import 'package:flutter/material.dart';
import 'package:resume_bulider/ResumeFormScreen.dart';
import 'package:resume_bulider/mainScreen.dart';

void main() {
  runApp(ResumeBuilderApp());
}

class ResumeBuilderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Resume Builder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Poppins', // Default font for the app
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Initial route points to the MainScreen
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/form': (context) => ResumeFormScreen(), // Register form screen
      },
    );
  }
}
