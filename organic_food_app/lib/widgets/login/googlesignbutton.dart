import 'package:flutter/material.dart';

class GoogleSignButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double textSize;

  GoogleSignButton({
    required this.title,
    required this.onPressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
    this.textSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/icon/google_logo.png',
              height: 24), // Replace with your icon path
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(color: textColor, fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
