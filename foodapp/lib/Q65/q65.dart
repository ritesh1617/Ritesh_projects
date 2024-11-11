import 'package:flutter/material.dart';

class Q65 extends StatefulWidget {
  @override
  _Q65State createState() => _Q65State();
}

class _Q65State extends State<Q65> {
  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Exit Application"),
              content: Text("Are you sure you want to exit?"),
              actions: [
                TextButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(false); // Close the dialog, stay in app
                  },
                ),
                TextButton(
                  child: Text("Exit"),
                  onPressed: () {
                    Navigator.of(context)
                        .pop(true); // Close the dialog and exit app
                  },
                ),
              ],
            );
          },
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Exit Confirmation"),
        ),
        body: Center(
          child: Text("Press back to see the exit confirmation dialog."),
        ),
      ),
    );
  }
}
