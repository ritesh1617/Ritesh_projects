import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LifecycleDemoScreen(),
    );
  }
}

class LifecycleDemoScreen extends StatefulWidget {
  @override
  _LifecycleDemoScreenState createState() => _LifecycleDemoScreenState();
}

class _LifecycleDemoScreenState extends State<LifecycleDemoScreen> {
  @override
  void initState() {
    super.initState();
    _showToast("initState - Widget is being created");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showToast("didChangeDependencies - Dependencies changed");
  }

  @override
  void didUpdateWidget(LifecycleDemoScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _showToast("didUpdateWidget - Widget updated");
  }

  @override
  void deactivate() {
    _showToast("deactivate - Widget is about to be removed");
    super.deactivate();
  }

  @override
  void dispose() {
    _showToast("dispose - Widget is being disposed");
    super.dispose();
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _showToast("setState - State is being updated");
            });
          },
          child: Text("Press to Trigger setState"),
        ),
      ),
    );
  }
}
