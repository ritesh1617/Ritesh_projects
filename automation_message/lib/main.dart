import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initNotifications();  // Initialize notifications
  runApp(MyApp());
}

// Flutter Local Notifications initialization
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  DateTime? _selectedTime;

  // Schedule the WhatsApp message
  Future<void> _scheduleMessage() async {
    if (_selectedTime != null && _phoneNumberController.text.isNotEmpty && _messageController.text.isNotEmpty) {
      // Use modulo to ensure the notification ID is a 32-bit integer
      int notificationId = DateTime.now().millisecondsSinceEpoch % 2147483647;

      // Schedule notification to trigger opening WhatsApp
      await flutterLocalNotificationsPlugin.schedule(
        notificationId,
        'Scheduled WhatsApp Message',
        'Open WhatsApp to send your message',
        _selectedTime!,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id',
            'Scheduled Messages',
            channelDescription: 'Notifications for scheduled WhatsApp messages',
            importance: Importance.max,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        androidAllowWhileIdle: true,
      );

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Message scheduled for ${DateFormat('yyyy-MM-dd – kk:mm').format(_selectedTime!)}"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please fill in all fields and select a time"),
      ));
    }
  }

  // Open WhatsApp with the message
  void _openWhatsApp() async {
    String phoneNumber = _phoneNumberController.text;
    String message = _messageController.text;
    String whatsappUrl = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print("Could not launch $whatsappUrl");
    }
  }

  // Function to select time
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      DateTime now = DateTime.now();
      setState(() {
        _selectedTime = DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule WhatsApp Message"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(
                labelText: 'Phone Number (with country code)',
                hintText: '+1234567890',
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message',
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedTime != null
                      ? 'Selected Time: ${DateFormat('kk:mm').format(_selectedTime!)}'
                      : 'No Time Selected',
                ),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select Time'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scheduleMessage,
              child: Text('Schedule Message'),
            ),
          ],
        ),
      ),
    );
  }
}
