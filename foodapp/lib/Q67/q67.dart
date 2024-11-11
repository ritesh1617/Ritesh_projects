import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onMenuSelected(String choice) {
    if (choice == 'Profile') {
      // Navigate to the profile screen or display profile info
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profile selected")),
      );
    } else if (choice == 'Logout') {
      // Log out the user or perform any logout action
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logout selected")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Options Menu Example"),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onMenuSelected,
            itemBuilder: (BuildContext context) {
              return {'Profile', 'Logout'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Press the options menu in the top right"),
      ),
    );
  }
}
