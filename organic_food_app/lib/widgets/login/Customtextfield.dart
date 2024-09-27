// import 'package:flutter/material.dart';

// class MyTextField extends StatelessWidget {
//   final String label;
//   final bool obscureText;
//   final Function(String) onChanged;
//   final IconData licon;
//   final TextEditingController controller;
//   final Widget? suffixIcon; // Added suffixIcon parameter

//   MyTextField({
//     required this.label,
//     this.obscureText = false,
//     required this.onChanged,
//     required this.licon,
//     requ, required IconData iconired this.controller,
//     this.suffixIcon, // Initialize suffixIcon (optional)
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscureText,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: TextStyle(color: Colors.white),
//         prefixIcon: Icon(
//           licon,
//           color: Colors.white,
//         ),
//         suffixIcon: suffixIcon, // Add suffixIcon here
//         enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//         focusedBorder: UnderlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//       ),
//       style: TextStyle(color: Colors.white),
//     );
//   }
// }
// lib/widgets/login/CustomTextField.dart

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final IconData licon;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;

  const MyTextField({
    Key? key,
    required this.label,
    this.hintText = '',
    this.obscureText = false,
    required this.licon, // Note: 'icon' not 'licon'
    required this.controller,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(licon, color: Colors.green),
        suffixIcon: suffixIcon,
        labelText: label,
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
