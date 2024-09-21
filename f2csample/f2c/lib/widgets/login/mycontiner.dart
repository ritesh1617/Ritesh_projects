import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Widget child;

  MyContainer({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 350,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:
              child, // Pass the child widget to be displayed inside the container
        ),
      ),
    );
  }
}
