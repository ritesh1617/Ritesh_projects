import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Q63 extends StatefulWidget {
  @override
  _Q63State createState() => _Q63State();
}

class _Q63State extends State<Q63> {
  void _showChoiceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Make a Choice"),
          content: Text("Please select an option below."),
          actions: [
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "You selected Yes",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("No"),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "You selected No",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Maybe"),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "You selected Maybe",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
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
        title: Text("Choice Dialog Example"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showChoiceDialog,
          child: Text("Show Choice Dialog"),
        ),
      ),
    );
  }
}
