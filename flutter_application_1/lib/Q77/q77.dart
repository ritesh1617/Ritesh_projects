import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CallAndSmsScreen(),
    );
  }
}

class CallAndSmsScreen extends StatelessWidget {
  final String phoneNumber = '1234567890';
  final String message = 'Hello! How are you?';

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _sendSms(String phoneNumber, String message) async {
    final Uri url = Uri(
        scheme: 'sms', path: phoneNumber, queryParameters: {'body': message});
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call and SMS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _makePhoneCall(phoneNumber),
              child: Text("Make a Call"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _sendSms(phoneNumber, message),
              child: Text("Send SMS"),
            ),
          ],
        ),
      ),
    );
  }
}
