import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
// lib/widgets/login/Button.dart

import 'package:flutter/material.dart';

class Button_ extends StatelessWidget {
  final String title;
  final VoidCallback onpress;

  const Button_({
    Key? key,
    required this.title,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}

// lib/widgets/login/GoogleSignButton.dart

class GoogleSignButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const GoogleSignButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          'assets/icon/google_logo.png', // Ensure this asset exists
          height: 30,
          width: 30,
        ),
        label: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: Colors.grey.withOpacity(0.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          elevation: 2,
        ),
      ),
    );
  }
}
