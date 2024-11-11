import 'package:flutter/material.dart';

class que61 extends StatefulWidget {
  @override
  _que61State createState() => _que61State();
}

class _que61State extends State<que61> {
  String selectedItem = "Option 1";
  List<String> dropdownItems = ["Option 1", "Option 2", "Option 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Toolbar"),
        actions: [
          // DropdownButton as spinner
          DropdownButton<String>(
            value: selectedItem,
            onChanged: (String? newValue) {
              setState(() {
                selectedItem = newValue!;
              });
            },
            items: dropdownItems.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          // Search icon button
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search action here
            },
          ),
        ],
      ),
      body: Center(child: Text("Content goes here")),
    );
  }
}
