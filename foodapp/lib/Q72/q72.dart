import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneCallApp(),
    );
  }
}

class PhoneCallApp extends StatefulWidget {
  @override
  _PhoneCallAppState createState() => _PhoneCallAppState();
}

class _PhoneCallAppState extends State<PhoneCallApp> {
  bool _isPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  Future<void> _checkPermission() async {
    var status = await Permission.phone.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      _showPermissionDialog();
    } else if (status.isGranted) {
      setState(() {
        _isPermissionGranted = true;
      });
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Phone Permission Required"),
        content: Text("This app needs permission to make phone calls."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Deny"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              var status = await Permission.phone.request();
              if (status.isGranted) {
                setState(() {
                  _isPermissionGranted = true;
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Permission Denied")),
                );
              }
            },
            child: Text("Allow"),
          ),
        ],
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Call App"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _isPermissionGranted
              ? () => _makePhoneCall("1234567890")
              : () => _showPermissionDialog(),
          child: Text("Make a Call"),
        ),
      ),
    );
  }
}
