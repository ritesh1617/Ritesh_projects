import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawerApp(),
    );
  }
}

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    GalleryScreen(),
    AudioScreen(),
    VideoScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer after selecting an item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Media App with Drawer"),
      ),
      body: _screens[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Media Categories',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Gallery'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Audio'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.video_library),
              title: Text('Video'),
              onTap: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  'https://via.placeholder.com/150',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Image ${index + 1}'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class AudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.music_note),
          title: Text("Audio Track ${index + 1}"),
          subtitle: Text("Artist Name"),
        );
      },
    );
  }
}

class VideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.video_library),
          title: Text("Video ${index + 1}"),
          subtitle: Text("Video Description"),
        );
      },
    );
  }
}
