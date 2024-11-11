import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NameListScreen(),
    );
  }
}

class NameListScreen extends StatefulWidget {
  @override
  _NameListScreenState createState() => _NameListScreenState();
}

class _NameListScreenState extends State<NameListScreen> {
  final TextEditingController _nameController = TextEditingController();
  List<String> _names = [];

  void _addName() {
    if (_nameController.text.isNotEmpty) {
      setState(() {
        _names.add(_nameController.text);
        _nameController.clear();
      });
    }
  }

  void _showNameDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Selected Name"),
        content: Text(name),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _editName(int index) {
    _nameController.text = _names[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Name"),
        content: TextField(
          controller: _nameController,
          decoration: InputDecoration(hintText: "Enter new name"),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _names[index] = _nameController.text;
                _nameController.clear();
              });
              Navigator.pop(context);
            },
            child: Text("Update"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );
  }

  void _deleteName(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Item"),
        content: Text("Are you sure you want to delete this item?"),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _names.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: "Enter name"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addName,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _names.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showNameDialog(_names[index]),
                  onLongPress: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(200, 200, 0, 0),
                      items: [
                        PopupMenuItem(
                          child: Text("Edit"),
                          onTap: () {
                            Future.delayed(
                              Duration(seconds: 0),
                              () => _editName(index),
                            );
                          },
                        ),
                        PopupMenuItem(
                          child: Text("Delete"),
                          onTap: () {
                            Future.delayed(
                              Duration(seconds: 0),
                              () => _deleteName(index),
                            );
                          },
                        ),
                      ],
                    );
                  },
                  child: ListTile(
                    title: Text(_names[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
