import 'package:flutter/material.dart';

class Q62 extends StatefulWidget {
  @override
  _Q62State createState() => _Q62State();
}

class _Q62State extends State<Q62> {
  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.info, color: Colors.blue),
              SizedBox(width: 10),
              Text("Alert"),
            ],
          ),
          content: Text("This is a simple alert dialog with an icon."),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showAlertDialog,
          child: Text("Show Alert Dialog"),
        ),
      ),
    );
  }
}
