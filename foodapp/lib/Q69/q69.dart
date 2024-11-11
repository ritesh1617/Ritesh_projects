import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GmailApp(),
    );
  }
}

class GmailApp extends StatefulWidget {
  @override
  _GmailAppState createState() => _GmailAppState();
}

class _GmailAppState extends State<GmailApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [InboxScreen(), SentScreen(), DraftsScreen()];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gmail-like App"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Sent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drafts),
            label: 'Drafts',
          ),
        ],
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.email),
          title: Text("Inbox Email ${index + 1}"),
          subtitle: Text("This is the content of Inbox Email ${index + 1}"),
        );
      },
    );
  }
}

class SentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.send),
          title: Text("Sent Email ${index + 1}"),
          subtitle: Text("This is the content of Sent Email ${index + 1}"),
        );
      },
    );
  }
}

class DraftsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.drafts),
          title: Text("Draft Email ${index + 1}"),
          subtitle: Text("This is the content of Draft Email ${index + 1}"),
        );
      },
    );
  }
}
